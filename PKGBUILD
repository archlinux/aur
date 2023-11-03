# Maintainer: Mike Tigas <mike AT tig DOT as>
# Contributor: Shawn Nock <nock@nocko.se>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: simo <simo@archlinux.org>
# Contributor: KokaKiwi <kokakiwi+aur at kokakiwi [dot] net>

pkgname=tor-unstable
pkgver=0.4.8.8
pkgrel=1
pkgdesc='Anonymizing overlay network.'
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
sha256sums=('21bbe908cafeabff04636d26293540aa9366eb1cf389bc65dc2476c93e688004'
            '18db12c5bc13b0e9e5cb6e2848286c6f0875b60533894ee043bd484000f0fcff'
            'SKIP'
            'e450b141cbe657a152d56a931ff1eb76c6b17dbe7354b3fa188d8a5043779f11'
            '6354475c4ee4de0c1204ccc6ae20dea8e812f83f3134ee2d665592a2cfe327e5'
            '04eec05b4e61efccc58c5da657363f0c1059d7f122cb15c32331a201af2d7f94'
            '07bedb17660a3673b31b0005b6505065c90b32f2c6b28b969241da675560f926')
b2sums=('24dda7589d8c1318d008d69d1a2ecb65a0c80ee05cfca9f9a420784ff99b35645450c8330a23919f24068b7218e267a773292d5d7031f6a2c402fe2354a9a3f3'
        '697788e84f977ceaef05aca7bbf1385e6d40b80f1ec2c3ae024bffc87f507c34be5f3f5f62271c10b1e9aa8ed5fe64daa108e93d2bfa3f67f69e0409e41ab1a0'
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
