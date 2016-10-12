# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
_pkgname=atom
_version=arch
_fusurl="https://github.com/fusion809"
_language_patch2_url="${_fusurl}/language-patch2"

pkgname=${_pkgname}-editor-${_version}
_atomver=1.11.1
pkgver=1.11.1.aa1.6.2.db0.8.9.fu0.12.0.la0.9.2.lg0.92.2.li1.18.3.ll0.5.1.lp1.0.0.lu0.38.2.t2.4.2
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
"atom"
"atom.desktop"
"theme.patch"
"about-arch.patch")
md5sums=('c96d0f2d93d586b15d8eb58ba4fe5112'
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
         'df5504a024e1aadb9e4147a510d34e6c'
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
  until ./script/build; do :; done
}

package() {
  cd "$srcdir/${_pkgname}-${_atomver}"

  _ver=$(cat package.json | grep version | sed 's/version//g' | sed 's/://g' | sed 's/ //g' |  sed 's/"//g' | sed 's/,//g')

  _arch=amd64
  if [ "${CARCH}" = "i686" ]; then
  _arch=i386
  fi
  install -dm755 ${pkgdir}/usr/bin
  install -dm755 ${pkgdir}/usr/share/${_pkgname}
  install -dm755 ${pkgdir}/usr/share/applications
  install -dm755 ${pkgdir}/usr/share/licenses/$pkgname
  install -dm755 ${pkgdir}/usr/share/pixmaps

  cp -r out/${_pkgname}-${_ver}-${_arch}/* ${pkgdir}/usr/share/${_pkgname}/
  mv ${pkgdir}/usr/share/${_pkgname}/atom.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
  mv ${pkgdir}/usr/share/${_pkgname}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 $srcdir/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -Dm644 $srcdir/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  rm ${pkgdir}/usr/share/${_pkgname}/resources/app/atom.sh
  rm -rf ${pkgdir}/usr/share/${_pkgname}/resources/app.asar.unpacked/resources
  ln -sf "/usr/share/${_pkgname}/resources/app/apm/node_modules/.bin/apm" "${pkgdir}/usr/bin/apm-${_version}"

  find "$pkgdir" \
    -name "*.a" -exec rm '{}' \; \
    -or -name "*.bat" -exec rm '{}' \; \
    -or -name "benchmark" -prune -exec rm -r '{}' \; \
    -or -name "doc" -prune -exec rm -r '{}' \; \
    -or -name "html" -prune -exec rm -r '{}' \; \
    -or -name "man" -prune -exec rm -r '{}' \; \
    -or -path "*/less/gradle" -prune -exec rm -r '{}' \; \
    -or -path "*/task-lists/src" -prune -exec rm -r '{}' \; \
    -or -name "package.json" -exec sed -i -e "s|${srcdir}/atom-${_ver}/apm|/usr/share/${_pkgname}/resources/app/apm|g" '{}' +
}
