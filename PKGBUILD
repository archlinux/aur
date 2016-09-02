# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>
# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

_pkgname=atom
_version=beta

# Versions
_about_url="https://github.com/fusion809/about"
_about_arch_ver=1.6.2
_language_gfm2_ver=0.92.2
_language_liquid_ver=0.5.1

pkgname=${_pkgname}-editor-${_version}
_pkgrel=3
_pkgver=1.11.0
pkgver="${_pkgver}.beta${_pkgrel}.m${_language_gfm2_ver}"
_ver=$_pkgver-beta${_pkgrel}
pkgrel=1
pkgdesc='Hackable text editor for the 21st Century, built using web technologies on the Electron framework - Beta channel.'
arch=('x86_64' 'i686')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python2')
optdepends=('gvfs: file deletion support')
makedepends=('git' 'npm')
conflicts=('atom-editor-beta-bin' 'atom-editor-beta-arch')
install=atom.install
source=("${_pkgname}-${_pkgver}-${_version}${_pkgrel}.tar.gz::$url/archive/v${_pkgver}-${_version}${_pkgrel}.tar.gz"
"about-arch-${_about_arch_ver}.tar.gz::$_about_url/archive/v${_about_arch_ver}.tar.gz"
"${_pkgname}-${_version}.desktop"
"${_pkgname}-${_version}"
"about-beta.patch")
sha256sums=('71d36396dcb11ae82e588f3f4f1520d72d78145092d749e4fc9827ad81155c9e'
            'b76bdecbf42456c66c029b4f9c75cb8acde389119e1e4a29de2980443703d752'
            'c62faaf2f50cddb1a834ccb33c95724076d2859c88baac7d9d676bc9c3afc8c6'
            '230563ed327833351d448e152ab8b146d2d2b7bdac42c7d39eef966b96b862fc'
            'f0af112075822a7163a5f9be7a096524fbdd4c39f1c56c6913b3f9f99aea0491')

prepare() {
	cd "$srcdir/${_pkgname}-${_pkgver}-${_version}${_pkgrel}"

  sed -i -e "/exception-reporting/d" \
	       -e "/metrics/d" \
         -e "s/\"language-gfm\": \".*\",/\"language-gfm2\": \"${_language_gfm2_ver}\",\n    \"language-liquid\": \"${_language_liquid_ver}\",/g" \
         -e "s/\"about\": \".*\"/\"about-arch\": \"${_about_arch_ver}\"/g" \
         package.json

	chmod 755 -R package.json

  sed -i -e 's@node script/bootstrap@node script/bootstrap --no-quiet@g' \
  ./script/build

  if ! [[ -d node_modules ]]; then
    mkdir -p node_modules
  else
    rm -rf node_modules/about-arch
  fi

  mv $srcdir/about-${_about_arch_ver} $srcdir/about-arch
  mv $srcdir/about-arch node_modules
  cd node_modules/about-arch
  patch -Np1 -i $srcdir/about-beta.patch
  cd -

	sed -i -e "s/<%=Desc=%>/$pkgdesc/g" ${srcdir}/${_pkgname}-${_version}.desktop
}

build() {
	cd "$srcdir/${_pkgname}-${_pkgver}-${_version}${_pkgrel}"

	export PYTHON=/usr/bin/python2
	until ./script/build; do :; done
}

package() {
	cd "$srcdir/${_pkgname}-${_pkgver}-${_version}${_pkgrel}"

  _ver=$(cat package.json | grep version | sed 's/version//g' | sed 's/://g' | sed 's/ //g' |  sed 's/"//g' | sed 's/,//g')

  _arch=amd64
  if [ "${CARCH}" = "i686" ]; then
  _arch=i386
  fi
  install -dm755 ${pkgdir}/usr/bin
  install -dm755 ${pkgdir}/usr/share/${_pkgname}-${_version}
  install -dm755 ${pkgdir}/usr/share/applications
  install -dm755 ${pkgdir}/usr/share/licenses/$pkgname
  install -dm755 ${pkgdir}/usr/share/pixmaps

  cp -r out/${_pkgname}-${_version}-${_ver}-${_arch}/* ${pkgdir}/usr/share/${_pkgname}-${_version}/
  mv ${pkgdir}/usr/share/${_pkgname}-${_version}/atom.png ${pkgdir}/usr/share/pixmaps/${_pkgname}-${_version}.png
  mv ${pkgdir}/usr/share/${_pkgname}-${_version}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 $srcdir/${_pkgname}-${_version} ${pkgdir}/usr/bin/${_pkgname}-${_version}
  install -Dm644 $srcdir/${_pkgname}-${_version}.desktop ${pkgdir}/usr/share/applications/${_pkgname}-${_version}.desktop
  rm ${pkgdir}/usr/share/${_pkgname}-${_version}/resources/app/atom.sh
  rm -rf ${pkgdir}/usr/share/${_pkgname}-${_version}/resources/app.asar.unpacked/resources
  ln -sf "/usr/share/${_pkgname}-${_version}/resources/app/apm/node_modules/.bin/apm" "${pkgdir}/usr/bin/apm-${_version}"

  find "$pkgdir" \
    -name "*.a" -exec rm '{}' \; \
    -or -name "*.bat" -exec rm '{}' \; \
    -or -name "benchmark" -prune -exec rm -r '{}' \; \
    -or -name "doc" -prune -exec rm -r '{}' \; \
    -or -name "html" -prune -exec rm -r '{}' \; \
    -or -name "man" -prune -exec rm -r '{}' \; \
    -or -path "*/less/gradle" -prune -exec rm -r '{}' \; \
    -or -path "*/task-lists/src" -prune -exec rm -r '{}' \; \
    -or -name "package.json" -exec sed -i -e "s|${srcdir}/atom-${_ver}/apm|/usr/share/${_pkgname}-${_version}/resources/app/apm|g" '{}' +
}
