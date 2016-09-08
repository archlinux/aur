# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
_pkgname=atom
_version=arch
_fusurl="https://github.com/fusion809"
_language_patch2_url="${_fusurl}/language-patch2"

# Module Versions
_electron_ver=0.36.12

pkgname=${_pkgname}-editor-${_version}
_atomver=1.10.2
pkgver=1.10.2.aa1.6.2.db0.8.9.fu0.12.0.la0.9.1.lg0.92.2.li1.18.3.ll0.5.1.lp1.0.0.lu0.37.8.t2.3.1
pkgrel=1
pkgdesc="Hackable text editor for the 21st Century, built using web technologies, with some extra packages for Arch Linux package development pre-installed."
arch=('x86_64' 'i686')
_url='https://github.com/atom'
url="https://fusion809.github.io/atom-editor-arch/"
license=('MIT')
depends=('namcap' 'alsa-lib' 'desktop-file-utils' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python2' 'git')
optdepends=('gvfs: file deletion support')
makedepends=('npm' 'hunspell-en')
conflicts=('atom-editor-bin' 'atom-editor-beta')
install=${_pkgname}-${_version}.install
source=("${_pkgname}-${_atomver}.tar.gz::${_url}/atom/archive/v${_atomver}.tar.gz"
"about-arch::git+${_fusurl}/about"
"dark-bint-syntax::git+https://github.com/Murriouz/dark-bint-syntax"
"fusion-ui::git+${_fusurl}/fusion-ui"
"language-archlinux::git+${_fusurl}/language-archlinux"
"language-gfm2::git+${_fusurl}/language-gfm2"
"language-ini-desktop::git+${_fusurl}/language-ini-desktop"
"language-liquid::git+https://github.com/puranjayjain/language-liquid"
"language-patch2::git+${_fusurl}/language-patch2"
"language-unix-shell::git+${_fusurl}/language-shellscript"
"git+${_fusurl}/mydict"
"git+${_fusurl}/terminal-fusion"
"git+${_fusurl}/toolbar-fusion"
"atom"
"atom.desktop"
"theme.patch"
"about-arch.patch")
md5sums=('ea511e7a2f8c9fac6bc2062e52435cd9'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '74cc026d4104072dadb2733745f1b268'
         '367f71ad1cfc2e03e97a48d2e32995fb'
         '23a0d25e1759dc5bd0e6f7101fd8ea70'
         'ae16bb627ec10bde20c7093d4be18131')

pkgver() {
  function describe {
    printf "$(git -C "$srcdir/$1" describe --tags `git -C "$srcdir/$1" rev-list --tags --max-count=1` | sed 's/v//g')"
  }
  _about_arch_ver="$(describe about-arch)"
  _dark_bint_syntax_ver="$(describe dark-bint-syntax)"
  _fusion_ui_ver="$(describe fusion-ui)"
  _language_archlinux_ver="$(describe language-archlinux)"
  _language_gfm2_ver="$(describe language-gfm2)"
  _language_ini_desktop_ver="$(describe language-ini-desktop)"
  _language_liquid_ver="$(describe language-liquid)"
  _language_patch2_ver="$(describe language-patch2)"
  _language_unix_shell_ver="$(describe language-unix-shell)"
  _terminal_fusion_ver="$(describe terminal-fusion)"
  printf "${_atomver}.aa${_about_arch_ver}.db${_dark_bint_syntax_ver}.fu${_fusion_ui_ver}.la${_language_archlinux_ver}.lg${_language_gfm2_ver}.li${_language_ini_desktop_ver}.ll${_language_liquid_ver}.lp${_language_patch2_ver}.lu${_language_unix_shell_ver}.t${_terminal_fusion_ver}"
}

prepare() {
  cd "$srcdir/${_pkgname}-${_atomver}"

  function describe {
    printf "$(git -C "$srcdir/$1" describe --tags `git -C "$srcdir/$1" rev-list --tags --max-count=1` | sed 's/v//g')"
  }
  _about_arch_ver="$(describe about-arch)"
  _dark_bint_syntax_ver="$(describe dark-bint-syntax)"
  _fusion_ui_ver="$(describe fusion-ui)"
  _language_archlinux_ver="$(describe language-archlinux)"
  _language_gfm2_ver="$(describe language-gfm2)"
  _language_ini_desktop_ver="$(describe language-ini-desktop)"
  _language_liquid_ver="$(describe language-liquid)"
  _language_patch2_ver="$(describe language-patch2)"
  _language_unix_shell_ver="$(describe language-unix-shell)"
  _terminal_fusion_ver="$(describe terminal-fusion)"

  sed -i -e "/exception-reporting/d" \
         -e "/metrics/d" \
         -e "/-ui/d" \
         -e "/-syntax/d" \
         -e "/-theme/d" \
         -e "s/\"language-gfm\": \".*\",/\"language-gfm2\": \"${_language_gfm2_ver}\",\n    \"language-ini-desktop\": \"${_language_ini_desktop_ver}\",\n    \"language-liquid\": \"${_language_liquid_ver}\",\n    \"language-patch2\": \"${_language_patch2_ver}\",/g" \
         -e "/\"dependencies\": {/a \
                     \"language-patch2\": \"${_language_patch2_url}\",\n    \"atom-ui\": \"0.4.1\"," \
         -e "s/\"language-shellscript\": \".*\",/\"language-unix-shell\": \"${_language_unix_shell_ver}\",\n    \"language-archlinux\": \"${_language_archlinux_ver}\",\n    \"terminal-fusion\": \"${_terminal_fusion_ver}\",/g" \
         -e "s/\"about\": \".*\"/\"about-arch\": \"${_about_arch_ver}\"/g" \
         -e "/\"packageDependencies\": {/a \
              \"dark-bint-syntax\": \"${_dark_bint_syntax_ver}\",\n    \"fusion-ui\": \"${_fusion_ui_ver}\"," package.json

  chmod 755 -R package.json

  if ! [[ -d node_modules ]]; then
    mkdir -p node_modules
  else
    rm -rf node_modules/about-arch
  fi

  sed -i -e 's@node script/bootstrap@node script/bootstrap --no-quiet@g' \
  ./script/build || die "Fail fixing verbosity of script/build"

  # about-arch
  pushd $srcdir/about-arch
  git fetch -p
  git checkout -q $(git describe --tags `git rev-list --tags --max-count=1`)
  patch -Np1 -i $srcdir/about-arch.patch
  popd
  mkdir -p node_modules/about-arch
  cp -r $srcdir/about-arch/* node_modules/about-arch/

  sed -i -e "s/<%=Desc=%>/$pkgdesc/g" ${srcdir}/${_pkgname}.desktop

  patch -Np1 -i $srcdir/theme.patch
}

build() {
  cd "$srcdir/${_pkgname}-${_atomver}"
  export PYTHON=/usr/bin/python2
  until ./script/build --build-dir "$srcdir/atom-build"; do :; done
}

package() {
  cd "$srcdir/${_pkgname}-${_atomver}"

  script/grunt install --build-dir "$srcdir/atom-build" --install-dir "$pkgdir/usr"

  install -Dm755 $srcdir/${_pkgname} "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 $srcdir/${_pkgname}.desktop "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 resources/app-icons/stable/png/1024.png "$pkgdir/usr/share/pixmaps/atom.png"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  install -Dm644 $srcdir/mydict/en_AU* "${pkgdir}/usr/share/atom/resources/app.asar.unpacked/node_modules/spellchecker/vendor/hunspell_dictionaries"

  find . -name "package.json" -exec sed -i -e "s|$srcdir/${_pkgname}-${_atomver}/apm|/usr/share/atom/resources/app/apm|g" '{}' +
}
