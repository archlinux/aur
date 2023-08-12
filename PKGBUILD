# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

_pkgbase='rxvt-unicode'
pkgname='rxvt-unicode-fontspacing-noinc-vteclear-secondarywheel'
pkgver=9.31
pkgrel=2
arch=('x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
pkgdesc='Unicode enabled rxvt-clone terminal emulator (urxvt) with fixed font spacing, no increment resizing, clear patched to behave like VTEs (keep all lines) and secondaryWheel.'
license=('GPL')
makedepends=(
  'libxt'
  'libxext'
  'libxmu'
  'signify'
)
depends=(
  'rxvt-unicode-terminfo'
  'libxft'
  'perl'
  'startup-notification'
  'libnsl'
  'libptytty'
  'libxext'
  'libxmu'
)
optdepends=('gtk2-perl: to use urxvt-tabbed')
source=(
  "$_pkgbase-$pkgver.tar.bz2::http://dist.schmorp.de/rxvt-unicode/$_pkgbase-$pkgver.tar.bz2"
  "$_pkgbase-$pkgver.tar.bz2.signature::http://dist.schmorp.de/rxvt-unicode/$_pkgbase-$pkgver.tar.bz2.sig"
  "$_pkgbase-$pkgver.pub::http://dist.schmorp.de/signing-key.pub"
  'perl-5.38.patch'
  'urxvt.desktop'
  'urxvtc.desktop'
  'urxvt-tabbed.desktop'
  'font-width-fix.patch'
  'line-spacing-fix.patch'
  'noinc.diff'
  'popup-menu-hang.diff'
  'clear.patch'
  'secondaryWheel.patch'
  'starttop.patch'
)
provides=('rxvt-unicode')
conflicts=('rxvt-unicode')

prepare() {
  # hacking around to validate with signify
  mv -v "$_pkgbase-$pkgver.tar.bz2."{signature,sig}
  signify -V -p "$_pkgbase-$pkgver.pub" -m "$_pkgbase-$pkgver.tar.bz2"

  patch -d $_pkgbase-$pkgver -p1 < perl-5.38.patch # Locale fix for perl 5.38

  cd $_pkgbase-$pkgver
  patch -p0 -i ../font-width-fix.patch
  patch -p0 -i ../line-spacing-fix.patch
  patch -p0 -i ../popup-menu-hang.diff
  patch -p1 -i ../noinc.diff
  patch -p1 -i ../clear.patch
  patch -p1 -i ../secondaryWheel.patch
  # https://bugs.archlinux.org/task/77062
  patch -p1 -i ../starttop.patch
}

build() {
  cd $_pkgbase-$pkgver
  # we disable smart-resize (FS#34807)
  # do not specify --with-terminfo (FS#46424)
  # do not specify --disable-frills (FS#77474)
  # workaround ncurses --disable-root-access (FS#79143)
  export TIC="/usr/bin/tic -o${srcdir}/terminfo"
  ./configure \
    --prefix=/usr \
    --enable-256-color \
    --enable-combining \
    --enable-fading \
    --enable-font-styles \
    --enable-iso14755 \
    --enable-keepscrolling \
    --enable-lastlog \
    --enable-mousewheel \
    --enable-next-scroll \
    --enable-perl \
    --enable-pointer-blank \
    --enable-rxvt-scroll \
    --enable-selectionscrolling \
    --enable-slipwheeling \
    --disable-smart-resize \
    --enable-startup-notification \
    --enable-transparency \
    --enable-unicode3 \
    --enable-utmp \
    --enable-wtmp \
    --enable-xft \
    --enable-xim \
    --enable-xterm-scroll \
    --disable-pixbuf
  make
}

package() {
  # install freedesktop menu
  for _f in urxvt urxvtc urxvt-tabbed; do
    install -Dm 644 ${_f}.desktop "${pkgdir}/usr/share/applications/${_f}.desktop"
  done

  cd ${_pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  # install the tabbing wrapper ( requires gtk2-perl! )
  sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
  install -Dm 755 doc/rxvt-tabbed "${pkgdir}/usr/bin/urxvt-tabbed"
}

sha256sums=('aaa13fcbc149fe0f3f391f933279580f74a96fd312d6ed06b8ff03c2d46672e8'
            'afea78dc25db8cd15da9959baf347b0634f4ef62dd3eeaff0c0a3389986b6a3e'
            '48ef5720d77a870f25737b8f66fe2c1f88a01810013df70cb8155add904288e4'
            '4bec0bf559a2eb6649e077b220fe25f532a8bc3da98ac519bc72a39b223e2cc4'
            '5f9c435d559371216d1c5b49c6ec44bfdb786b12d925d543c286b0764dea0319'
            '91536bb27c6504d6cb0d33775a0c4709a4b439670b900f0c278c25037f19ad66'
            'ccd7c436e959bdc9ab4f15801a67c695b382565b31d8c352254362e67412afcb'
            'ee7ad6f56c22fa7379c1ac2594ff941bf7f99344152da0b813319d3dadd1395b'
            '8d5f2ee9dae827b7a99757fd5432416927a31cde2093e3ad1aefee0987d6ab8d'
            '0ee0434eb84b3ce1f62a4e02c0ba6d0940f4c62477e8982eb9219186feb393e3'
            '64afd103527ce2cb2a8c51fefd815615afd0a63bbb810f2fb5ea38f6280def03'
            '9df34ba141a9e32d785f63b050ab82e6e6c745b391c5b16e17bec4dcd4a2b087'
            '70b2c60887df3b335cd9b26a8ec3964845f75cca98099c7c5a6be4fa74770f57'
            '26bcc874e17db6ab676649dab12f6afd308754fb77673df5e6b5a74d0b89efc7')

# vim: ts=2 sw=2 et:
