# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

_pkgname=atom
_version=arch

# Module Versions
_about_arch_url="fusion809/about"
_about_arch_ver=1.5.18
_dark_bint_syntax_ver=0.8.8
_fusion_ui_ver=0.10.6
_language_archlinux_ver=0.2.4
_language_gfm2_ver=0.90.3
_language_ini_desktop_ver=1.18.0
_language_liquid_ver=0.5.1
_language_patch2_url="fusion809/language-patch2"
_language_patch2_ver=0.1.3
_language_unix_shell_ver=0.29.3

pkgname=${_pkgname}-editor-${_version}
_atomver=1.8.0
pkgver=${_atomver}.arch${_language_archlinux_ver}
pkgrel=2
pkgdesc='Hackable text editor for the 21st Century, built using web technologies, with some extra packages for Arch Linux package development pre-installed.'
arch=('x86_64' 'i686')
url='https://github.com/atom/atom'
license=('MIT')
depends=('namcap' 'pkgbuild-introspection' 'alsa-lib' 'desktop-file-utils' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python2')
optdepends=('gvfs: file deletion support')
makedepends=('git' 'npm')
conflicts=('atom-editor-bin' 'atom-editor')
install=${_pkgname}-${_version}.install
source=("${_pkgname}-${_atomver}.tar.gz::https://github.com/atom/atom/archive/v${_atomver}.tar.gz"
"about-arch-${_about_arch_ver}.tar.gz::https://github.com/$_about_arch_url/archive/v${_about_arch_ver}.tar.gz"
"atom"
"atom.desktop"
"theme.patch"
"about-arch.patch")
md5sums=('158c18d35d071403db18bdd85fa2e738'
         '3e14baadf7d6c97f56704c0922026f3b'
         '74cc026d4104072dadb2733745f1b268'
         '367f71ad1cfc2e03e97a48d2e32995fb'
         '23a0d25e1759dc5bd0e6f7101fd8ea70'
         'ae16bb627ec10bde20c7093d4be18131')

prepare() {
  cd "$srcdir/${_pkgname}-${_atomver}"

  sed -i -e "/exception-reporting/d" \
         -e "/metrics/d" \
         -e "/-ui/d" \
         -e "/-syntax/d" \
         -e "/-theme/d" \
         -e 's/0.36.8/0.36.12/g' \
         -e "s/\"language-gfm\": \".*\",/\"language-gfm2\": \"${_language_gfm2_ver}\",\n    \"language-ini-desktop\": \"${_language_ini_desktop_ver}\",\n    \"language-liquid\": \"${_language_liquid_ver}\",\n    \"language-patch2\": \"${_language_patch2_ver}\",/g" \
         -e "s/\"language-shellscript\": \".*\",/\"language-unix-shell\": \"${_language_unix_shell_ver}\",\n    \"language-archlinux\": \"${_language_archlinux_ver}\",/g" \
         -e "s/\"about\": \".*\"/\"about-arch\": \"${_about_arch_ver}\"/g" \
         -e "/\"dependencies\": {/a \
              \"language-patch2\": \"${_language_patch2_url}\"," \
         -e "/\"packageDependencies\": {/a \
              \"dark-bint-syntax\": \"${_dark_bint_syntax_ver}\",\n    \"fusion-ui\": \"${_fusion_ui_ver}\"," \
         -e "s|^\"|    \"|g"  package.json # fixing spacing issues

  chmod 755 -R package.json

  if ! [[ -d node_modules ]]; then
    mkdir -p node_modules
  else
    rm -rf node_modules/about-arch
  fi

  sed -i -e 's@node script/bootstrap@node script/bootstrap --no-quiet@g' \
  ./script/build || die "Fail fixing verbosity of script/build"

  mv $srcdir/about-${_about_arch_ver} $srcdir/about-arch
  mv $srcdir/about-arch node_modules

  cd node_modules/about-arch
  patch -Np1 < $srcdir/about-arch.patch
  cd -

  sed -i -e "s/<%=Desc=%>/$pkgdesc/g" ${srcdir}/${_pkgname}.desktop

  patch -Np1 < $srcdir/theme.patch
}

build() {
  cd "$srcdir/${_pkgname}-${_atomver}"
  export PYTHON=/usr/bin/python2
  until ./script/build --build-dir "$srcdir/atom-build"; do :; done
}

package() {
  cd "$srcdir/${_pkgname}-${_atomver}"

  script/grunt install --build-dir "$srcdir/atom-build" --install-dir "$pkgdir/usr"

  install -Dm644 $srcdir/${_pkgname}.desktop "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 resources/app-icons/stable/png/1024.png "$pkgdir/usr/share/pixmaps/atom.png"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
