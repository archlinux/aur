# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>
# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

_pkgname=atom
_version=git

# Module Versions
_fus_url="https://github.com/fusion809"
_language_gfm2_ver=0.92.2
_language_ini_desktop_ver=1.18.3
_language_liquid_ver=0.5.1
_language_patch2_url="${_fus_url}/language-patch2"
_language_patch2_ver=1.0.0
_language_unix_shell_ver=0.39.0
_language_vala_modern_ver=0.3.2

pkgname=${_pkgname}-editor-${_version}
pkgver=1.14.0.dev.i1.18.3.l0.5.1.m0.92.2.p1.0.0.u0.39.0.v0.3.2.c30397
pkgrel=1
pkgdesc='Hackable text editor for the 21st Century, based on web technologies - git channel.'
arch=('x86_64' 'i686')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs-lts-boron'  'nss' 'python2')
optdepends=('gvfs: file deletion support')
makedepends=('git' 'npm')
install=${_pkgname}-${_version}.install
source=("git+${url}.git"
"${_pkgname}-${_version}.desktop"
"${_pkgname}-${_version}")
sha256sums=('SKIP'
            'b172e3f81eb42eeb1ad6ef70300c33a79a2015110ea87c413b5857c9694d10e9'
            '20d3c386dd60e85977511f9138e32921af051fd7e573d3052822219bd7210be9')

pkgver() {
  cd $srcdir/$_pkgname
  _basever=$(cat package.json | grep version | sed 's/version//g' | sed 's/://g' | sed 's/ //g' |  sed 's/"//g' | sed 's/,//g' | sed 's/-/./g')
  _commitno=$(git rev-list --count HEAD)
  printf "${_basever}.i${_language_ini_desktop_ver}.l${_language_liquid_ver}.m${_language_gfm2_ver}.p${_language_patch2_ver}.u${_language_unix_shell_ver}.v${_language_vala_modern_ver}.c${_commitno}"
}

prepare() {
	cd "$srcdir/${_pkgname}"

  sed -i -e "/exception-reporting/d" \
	       -e "/metrics/d" \
         -e "/\"dependencies\": {/a \
            \"language-patch2\": \"${_language_patch2_url}\"," \
         -e "s/\"language-gfm\": \".*\",/\"language-gfm2\": \"${_language_gfm2_ver}\",\n    \"language-ini-desktop\": \"${_language_ini_desktop_ver}\",\n    \"language-liquid\": \"${_language_liquid_ver}\",\n    \"language-patch2\": \"${_language_patch2_ver}\",/g" \
         -e "s/\"language-shellscript\": \".*\",/\"language-unix-shell\": \"${_language_unix_shell_ver}\",\n    \"language-vala-modern\": \"${_language_vala_modern_ver}\",/g" \
         package.json

	chmod 755 -R package.json

  sed -i -e 's@node script/bootstrap@node script/bootstrap --no-quiet@g' \
  ./script/build || die "Fail fixing verbosity of script/build"

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
  install -dm755 ${pkgdir}/usr/bin
  install -dm755 ${pkgdir}/usr/share/${_pkgname}-${_version}
  install -dm755 ${pkgdir}/usr/share/applications
  install -dm755 ${pkgdir}/usr/share/licenses/$pkgname
  install -dm755 ${pkgdir}/usr/share/pixmaps

  cp -r out/atom-${_ver}-${_commit}-${_arch}/* ${pkgdir}/usr/share/${_pkgname}-${_version}/
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
    -or -name "package.json" -exec sed -i -e "s|${srcdir}/atom/apm|/usr/share/${_pkgname}-${_version}/resources/app/apm|g" '{}' +
}
