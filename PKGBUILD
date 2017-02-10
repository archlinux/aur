# Maintainer: Sky Chan <diufanshu@gmail.com>
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>

_pkgname=atom
_version=beta
_mirror=mirror

# Versions
_language_gfm2_ver=0.92.2
_language_ini_desktop_ver=1.18.3
_language_liquid_ver=0.5.1
_language_patch2_url="${_fus_url}/language-patch2"
_language_patch2_ver=1.0.0
_language_unix_shell_ver=0.40.1
_language_vala_modern_ver=0.3.2
_terminal_fusion_ver=2.4.3

pkgname=${_pkgname}-editor-${_version}-${_mirror}
_pkgrel=1
_pkgver=1.15.0
pkgver="${_pkgver}.beta${_pkgrel}.m${_language_gfm2_ver}"
_ver=$_pkgver-beta${_pkgrel}
pkgrel=1
pkgdesc='Hackable text editor atom-editor-beta use source mirror in China.'
arch=('x86_64' 'i686')
url="https://npm.taobao.org/mirrors/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs-lts-boron' 'nss' 'python2')
optdepends=('gvfs: file deletion support')
makedepends=('git' 'npm')
conflicts=('atom-editor-beta-bin' 'atom-editor-beta-arch' 'atom-editor-beta' 'atom-editor-beta-bin-mirror' )
install=atom.install
source=("${_pkgname}-${_pkgver}-${_version}${_pkgrel}.tar.gz::$url/${_pkgver}-${_version}${_pkgrel}/v${_pkgver}-${_version}${_pkgrel}.tar.gz"
"${_pkgname}-${_version}.desktop")
sha256sums=('4b4399ed7cda6a76bf53c21dbdb21658d4a5cb1f9904e409ca2badc2ea6e768a'
            'c62faaf2f50cddb1a834ccb33c95724076d2859c88baac7d9d676bc9c3afc8c6')
prepare() {
	cd "$srcdir/${_pkgname}-${_pkgver}-${_version}${_pkgrel}"

  sed -i -e "/exception-reporting/d" \
         -e "/metrics/d" \
         -e "/\"dependencies\": {/a \
            \"language-patch2\": \"${_language_patch2_url}\"," \
         -e "s/\"language-gfm\": \".*\",/\"language-gfm2\": \"${_language_gfm2_ver}\",\n    \"language-ini-desktop\": \"${_language_ini_desktop_ver}\",\n    \"language-liquid\": \"${_language_liquid_ver}\",\n    \"language-patch2\": \"${_language_patch2_ver}\",/g" \
         -e "s/\"language-shellscript\": \".*\",/\"language-unix-shell\": \"${_language_unix_shell_ver}\",\n    \"language-vala-modern\": \"${_language_vala_modern_ver}\",\n    \"terminal-fusion\": \"${_terminal_fusion_ver}\",/g" \
         package.json

	chmod 755 -R package.json

  sed -i -e 's@node script/bootstrap@node script/bootstrap --no-quiet@g' \
  ./script/build

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
  install -Dm644 $srcdir/${_pkgname}-${_version}.desktop ${pkgdir}/usr/share/applications/${_pkgname}-${_version}.desktop
  cp ${pkgdir}/usr/share/${_pkgname}-${_version}/resources/app/atom.sh ${pkgdir}/usr/bin/atom-beta
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
