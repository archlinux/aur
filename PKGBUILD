# Maintainer: korimitsu <korimitsu_aur.wackiness926@passinbox.com>
# Based on PKGBUILD by:
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Sebastian Wiesner <lunaryorn@googlemail.com>
# Contributor: Benjamin Andresen <benny@klapmuetz.org>
# Contributor: scj <scj@archlinux.us>
# Contributor: Alif <alive4ever@live.com>

# Adds AARCH64 and mirror for source tarball
pkgname=ocaml4-findlib-noframepointers
pkgver=1.9.6
pkgrel=9
# Not enabling '--enable-frame-pointers' in the ocaml4 configure is required for aarch64 compilation, not for x86_64. This is why all the '-noframepointers' packages exist.
pkgdesc='OCaml package manager. Patched for x86_64/aarch64 and no ocaml4 frame-pointers.'
arch=(x86_64 aarch64)
url='http://projects.camlcity.org/projects/findlib.html'
license=(MIT)
depends=(ocaml4-compiler-libs-noframepointers ocaml4-noframepointers)
provides=("ocaml4-findlib=${pkgver}")
conflicts=("ocaml4-findlib" "ocaml-findlib")
options=(!makeflags !strip staticlibs zipman)
backup=(etc/findlib.conf)

# HTTP 504 most of the time
#source=("http://download.camlcity.org/download/findlib-$pkgver.tar.gz")
source=("findlib-${pkgver}.tar.gz::https://gentoo.osuosl.org/distfiles/28/findlib-${pkgver}.tar.gz")
b2sums=('c9c98b9e92c0cf690e2c8794a1ed606c0288d49a016dfa08592c9f617be1020385f52bf37345a7cbcbc7f0fcb19750a6617036cbf90afef231eccdbc7132baf8')

build() {
  cd "findlib-$pkgver"
  ./configure \
    -config /etc/findlib.conf \
    -mandir /usr/share/man \
    -sitelib /usr/lib/ocaml
  make all opt
}

package() {
  cd "findlib-$pkgver"
  make prefix="$pkgdir" install

  # Install ocamlfind_opt (built by 'make opt')
  install -Dm755 src/findlib/ocamlfind_opt "$pkgdir/usr/bin/ocamlfind_opt"

  # Drop camlp4 META that findlib ships to avoid file overlap with ocaml4-camlp4
  # (findlib installs site-lib-src/camlp4/META and tools/safe_camlp4)
  # "/usr/lib/ocaml/camlp4/META" is installed too by "ocaml4-findlib-noframepointers-1.9.6-8-$ARCH.pkg.tar.xz" but belongs only to "ocaml4-camlp4-noframepointers-4.14+1-2-$ARCH.pkg.tar.xz"
  rm -f "$pkgdir/usr/lib/ocaml/camlp4/META"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
