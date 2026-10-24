# Maintainer: Gergely Imreh <gergely at imreh dot net>

pkgname=gnushogi
pkgver=1.4.2
pkgrel=4
pkgdesc="GNU Shogi (Japanese chess) engine"
arch=('x86_64' 'aarch64')
url="https://www.gnu.org/software/gnushogi/"
license=('GPL-3.0-or-later')
depends=('glibc' 'ncurses')
source=("https://ftp.gnu.org/gnu/gnushogi/${pkgname}-${pkgver}.tar.gz"{,.sig}
        "01-make-dont-ignore.patch"
        "gcc-10-globals.patch")
validpgpkeys=('F9113B1F55336A8B4376E3B0029820396BC37E36') # Yann Dirson
sha256sums=('1ecc48a866303c63652552b325d685e7ef5e9893244080291a61d96505d52b29'
            'SKIP'
            '9f2afc599aec2c75770aae10d2bd10acf75446ad0967f54b43cd9c6a12d94306'
            'bc4818c5ca20aab50f684d1dcf13745310980ba00932f34babb45388258c97dd')
b2sums=('ecd61e80359a1367fc1b770584f3f238d1c8fb337539e755caf852b1691eb89eef6bc287b7a0b61e00e170c490c5cea926bc29f3ae8885258596092c9e53fff1'
        'SKIP'
        '0e151a892905a2393510093af66f567e085ddfa6d9c5be73c0eac50d7573ef17700d3509f874f3822a7890ce25cad21ef1bd60cecf70f59041ffedff097eef07'
        '5833c66ba7bff035bf808472e6ce11ae9e3ec7bd257887c7c6ca5d15e0c76405fc283b108b20ec1b8a313b32ce32583bc706eabdc89cf9561574e50744fb1c82')

prepare() {
  cd "${pkgname}-${pkgver}"
  # Patches from Debian 1.4.2-7:
  # don't ignore failures in the sub-makes (Debian #901539)
  patch -Np1 -i "${srcdir}/01-make-dont-ignore.patch"
  # GCC 10 defaults to -fno-common, so define the globals only once
  patch -Np1 -i "${srcdir}/gcc-10-globals.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  # Curses is auto-detected otherwise; pin it as Debian does (adds the -C UI).
  # The check also links -ltermcap, which Arch lacks; -lcurses alone is fine.
  ./configure --prefix=/usr --with-curses ac_cv_lib_curses_clrtoeol=yes
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  echo quit | ./gnushogi/gnushogi
}

package() {
  cd "${pkgname}-${pkgver}"
  # Install by hand: upstream's install target strips the binary and
  # has no DESTDIR, putting man/info under /usr/man and /usr/info
  install -Dm755 -t "${pkgdir}/usr/bin" gnushogi/gnushogi
  install -Dm644 -t "${pkgdir}/usr/lib/gnushogi" gnushogi/gnushogi.bbk
  install -Dm644 -t "${pkgdir}/usr/share/man/man6" doc/gnushogi.6
  install -Dm644 -t "${pkgdir}/usr/share/info" doc/gnushogi.info*
}
