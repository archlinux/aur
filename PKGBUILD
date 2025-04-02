# Maintainer: Mike Tigas <mike AT tig DOT as>
# Contributor: Shawn Nock <nock@nocko.se>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: simo <simo@archlinux.org>
# Contributor: KokaKiwi <kokakiwi+aur at kokakiwi [dot] net>

pkgname=tor-unstable
pkgver=0.4.9.2_alpha
pkgrel=1
pkgdesc='Anonymizing overlay network (with alpha/beta/rc)'
arch=('i686' 'x86_64' 'armv7h')
url='http://www.torproject.org/'
license=('BSD-3-Clause' 'LGPL-3.0-only' 'MIT')
depends=(
  'bash'
  'libcap.so'
  'libcrypto.so'
  'libevent'
  'liblzma.so'
  'libseccomp.so'
  'libssl.so'
  'libsystemd.so'
  'libz.so'
  'libzstd.so'
)
optdepends=('torsocks: for torify')
makedepends=('ca-certificates' 'systemd')
conflicts=('tor')
provides=('tor')
backup=('etc/tor/torrc')
install='tor.install'
source=("https://dist.torproject.org/tor-${pkgver/_/-}.tar.gz"{,.sha256sum{,.asc}}
        'torrc.patch'
        'tor.service'
        'tor.sysusers'
        'tor.tmpfiles')
sha256sums=('b9425cf767702d718848e8847498e0d46f2a261b87a7b424dc18d2399531001a'
            'd0719e2d5f0e307795ed7d826bab22b5b743764f319d7a282cfc1dec6dff4272'
            'SKIP'
            'e450b141cbe657a152d56a931ff1eb76c6b17dbe7354b3fa188d8a5043779f11'
            '6354475c4ee4de0c1204ccc6ae20dea8e812f83f3134ee2d665592a2cfe327e5'
            '04eec05b4e61efccc58c5da657363f0c1059d7f122cb15c32331a201af2d7f94'
            '07bedb17660a3673b31b0005b6505065c90b32f2c6b28b969241da675560f926')
b2sums=('4391c5d53ff0478762df58989d22a4d31707cda0bb07a3d2442cb5fa87d06213a735fc7a0ecdd23b09e9f60960c3bbe32fc7faa34fc8a745538a696177830a72'
        'fe81c8a8049cad1c221b3c37601ef8219acdd3f65cda0ccb3e4db8f9900ee637f4ec6c072f6fa3034f5532b72db05b9ac779d4767b4dfd57d82ec4c216cfbb41'
        'SKIP'
        '770da249c40981c3937383f17e6e4432667868505876fd673312e669f2c46a0810aab579b654a8eed4a6ea573a0844fbe79d8145f358eb47fd7bc5dd89a32554'
        '79d35290cd40e407d3102366d585d37e3b50b41e30b7046f8b1c6a7ee199137701b3c5c4e63f5967d6185b66d675b71157d1ef673648162921323732bb0546cf'
        '9053da53926f2120ac57b6c1442238f5bbd89bf9270347c4e00b721b39939bebc6adfcf814a9d7289dfd14d085d91c193529305336db93190da5b7f586a031df'
        '5d55d9a7e42b6ce78b8ab985bab37afe8f0bacddb5abd895c4a490adb8f98b9422f90b40066fef05ecf37b7b21e80aadc615c4b7f6e12b05581304113a1b1f1d')
validpgpkeys=(
  '2133BC600AB133E1D826D173FE43009C4607B1FB' # Nick Mathewson
  'B74417EDDF22AC9F9E90F49142E86A2A11F48D36' # David Goulet
  '1C1BC007A9F607AA8152C040BEA7B180B1491921' # Alexander Færøy
)

prepare() {
  sha256sum -c "tor-${pkgver/_/-}.tar.gz.sha256sum"

  cd "tor-${pkgver/_/-}"

  patch -Np1 -i "$srcdir/torrc.patch"
}

build() {
  cd "tor-${pkgver/_/-}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-gpl

  make
}

check() {
  cd "tor-${pkgver/_/-}"

  make check
}

package() {
  cd "tor-${pkgver/_/-}"

  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/etc/tor/torrc{.sample,}

  # install arch custom files
  install -Dm 644 "$srcdir"/*.service -t "$pkgdir"/usr/lib/systemd/system
  install -Dm 644 "$srcdir"/tor.sysusers "$pkgdir"/usr/lib/sysusers.d/tor.conf
  install -Dm 644 "$srcdir"/tor.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/tor.conf

  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim: ts=2 sw=2 et:
