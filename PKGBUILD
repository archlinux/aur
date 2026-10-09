# Maintainer: sfs sfslinux@gmail.com

pkgname=yad-light
_pkgname=yad
pkgver=15.0
pkgrel=7
pkgdesc='A fork of zenity - display graphical dialogs from shell scripts or command line (without HTML, AppIndicator, spell check and GtkSourceView)'
url='https://github.com/v1cont/yad'
arch=('x86_64')
license=('GPL3')
depends=('gtk3')
makedepends=('autoconf' 'automake' 'gettext')
optdepends=(
  'xdg-utils: open links from --text-info --show-uri and --icons (default OpenCommand)'
  'xterm: terminal for --icons entries with Terminal=true (default Terminal setting)'
  'xorg-xwayland: X11-only modes (--notebook, --paned, --plug) with GDK_BACKEND=x11 on Wayland'
)
source=("https://ftp.altlinux.org/pub/distributions/ALTLinux/Sisyphus/files/SRPMS/${_pkgname}-${pkgver}-alt1.src.rpm"
        'yad-settings'
        'wayland.en.txt'
        'wayland.ru.txt')
sha256sums=('7106e790dac1ef39cda18b6bd64c803bc8cd46b475473decba6cb4e5239fed49'
            'cade839df31924b33d8cfec7c1c5174f7eea41496cf1358472996cef427a9a0a'
            '48fbfb554f3e982f953811dbedcd1ebf5228bff71de88a50e1dfe7532e015296'
            '4fd9fd005335d3d0bcd45d4e4fccadcddb1de967203436eeaeb73318d3695903')
replaces=('yad')
provides=('yad')
conflicts=('yad' 'yad-git' 'yad-gtk2')

prepare() {
  tar -xf "v${pkgver}.tar.gz"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cp ../ru.po po && echo ru >> po/LINGUAS
  # Typo in ALT's translation turns this checkbox into a text field
  sed -i 's/текущую строку;CHK/текущую строку:CHK/' po/ru.po
  patch -Np1 -i ../show-cursor-initially.patch

  autoreconf -ivf
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Disabled to keep gtk3 as the only runtime dependency. These are build-time
  # switches: enabling one requires the library in makedepends and depends.
  #   --enable-html          webkit2gtk-4.1           --html dialog
  #   --enable-appindicator  libayatana-appindicator  --indicator (SNI tray, works on Wayland)
  #   --enable-spell         gspell                   spell checking
  #   --enable-sourceview    gtksourceview3           syntax highlighting in --text-info,
  #                                                   yad-settings "Editor" section
  ./configure \
    --prefix=/usr \
    --enable-icon-browser \
    --disable-html \
--enable-appindicator \
    --disable-spell \
    --disable-sourceview

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # The upstream editor needs X11; the wrapper picks it or the Wayland version.
  mv "${pkgdir}/usr/bin/yad-settings" "${pkgdir}/usr/bin/yad-settings-x11"
  install -Dm755 "${srcdir}/yad-settings" "${pkgdir}/usr/bin/yad-settings"
  # Read by yad-settings; kept outside /usr/share/doc so !docs/NoExtract cannot drop them.
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}" "${srcdir}"/wayland.{en,ru}.txt
}
