# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>
# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

_pkgname=atom
_version=git

# Module Versions
_about_url="https://github.com/fusion809/about"
_about_arch_ver=1.6.2
_language_gfm2_ver=0.92.2
_language_liquid_ver=0.5.1

pkgname=${_pkgname}-editor-${_version}
pkgver=1.12.0.dev.m0.92.229841
pkgrel=1
pkgdesc='Hackable text editor for the 21st Century, based on web technologies and built from the latest git source code'
arch=('x86_64' 'i686')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python2')
optdepends=('gvfs: file deletion support')
makedepends=('git' 'npm')
install=${_pkgname}-${_version}.install
source=("git+${url}.git"
"about-arch-${_about_arch_ver}.tar.gz::$_about_url/archive/v${_about_arch_ver}.tar.gz"
"about-git.patch"
"${_pkgname}-${_version}.desktop"
"${_pkgname}-${_version}")
sha256sums=('SKIP'
            'b76bdecbf42456c66c029b4f9c75cb8acde389119e1e4a29de2980443703d752'
            '8fd5c1f23ec4110ab339d2c8c4305c6d0e9f11f7f6ddc80f3c45ca990691ac43'
            'b172e3f81eb42eeb1ad6ef70300c33a79a2015110ea87c413b5857c9694d10e9'
            '542c10ffb540bd91a441682867517a02a959a20625293f72f33fab71cd3602be')

pkgver() {
  cd $srcdir/$_pkgname
  _basever=$(cat package.json | grep version | sed 's/version//g' | sed 's/://g' | sed 's/ //g' |  sed 's/"//g' | sed 's/,//g' | sed 's/-/./g')
  _commitno=$(git rev-list --count HEAD)
  printf "${_basever}.m${_language_gfm2_ver}${_commitno}"
}

prepare() {
	cd "$srcdir/${_pkgname}"

  # Remove exception-reporting/metrics (priv concerns)
  # Replace language-gfm with language-gfm2 and language-liquid (provides syntax-highlighting for Liquid/HTML in GFM docs)
  sed -i -e "/exception-reporting/d" \
	       -e "/metrics/d" \
         -e "s/\"language-gfm\": \".*\",/\"language-gfm2\": \"${_language_gfm2_ver}\",\n    \"language-liquid\": \"${_language_liquid_ver}\",/g" \
         -e "s/\"about\": \".*\"/\"about-arch\": \"${_about_arch_ver}\"/g" \
         package.json

	chmod 755 -R package.json

  sed -i -e 's@node script/bootstrap@node script/bootstrap --no-quiet@g' \
  ./script/build || die "Fail fixing verbosity of script/build"

  if ! [[ -d node_modules ]]; then
    mkdir -p node_modules
  else
    rm -rf node_modules/about-arch
  fi

  mv $srcdir/about-${_about_arch_ver} $srcdir/about-arch
  mv $srcdir/about-arch node_modules
  cd node_modules/about-arch
  patch -Np1 < $srcdir/about-git.patch

  sed -i -e "s/<%=Desc=%>/$pkgdesc/g" ${srcdir}/${_pkgname}-${_version}.desktop
}

build() {
  cd $srcdir/${_pkgname}
  export PYTHON=/usr/bin/python2
  until ./script/build; do :; done
}

package() {
	cd "$srcdir/${_pkgname}"

  _ver=$(cat package.json | grep version | sed 's/version//g' | sed 's/://g' | sed 's/ //g' |  sed 's/"//g' | sed 's/,//g')
  _commit=$(git rev-parse --short=7 HEAD)

  _arch=amd64
  if [ "${CARCH}" = "i686" ]; then
  _arch=i386
  fi
  install -dm755 ${pkgdir}/usr/share/atom-git
  install -dm755 ${pkgdir}/usr/bin
  install -dm755 ${pkgdir}/usr/share/applications
  install -dm755 ${pkgdir}/usr/share/pixmaps

  cp -r out/atom-${_ver}-${_commit}-${_arch}/* ${pkgdir}/usr/share/atom-git/
  mv ${pkgdir}/usr/share/atom-git/atom.png ${pkgdir}/usr/share/pixmaps/atom-git.png
  install -Dm755 $srcdir/atom-git ${pkgdir}/usr/bin/atom-git
  install -Dm644 $srcdir/atom-git.desktop ${pkgdir}/usr/share/applications/atom-git.desktop
  rm ${pkgdir}/usr/share/atom-git/resources/app/atom.sh
  rm -rf ${pkgdir}/usr/share/atom-git/resources/app.asar.unpacked/resources

  find "$pkgdir" \
    -name "*.a" -exec rm '{}' \; \
    -or -name "*.bat" -exec rm '{}' \; \
    -or -name "benchmark" -prune -exec rm -r '{}' \; \
    -or -name "doc" -prune -exec rm -r '{}' \; \
    -or -name "html" -prune -exec rm -r '{}' \; \
    -or -name "man" -prune -exec rm -r '{}' \; \
    -or -path "*/less/gradle" -prune -exec rm -r '{}' \; \
    -or -path "*/task-lists/src" -prune -exec rm -r '{}' \; \
    -or -name "package.json" -exec sed -i -e "s|${srcdir}/atom/apm|/usr/share/atom-git/resources/app/apm|g" '{}' +
}
