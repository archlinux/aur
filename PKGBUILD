# Contributor: Isak Karlsson <isak.karlsson@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Abuzer Rafey <arafey@vyvygen.org>

pkgbase=rust-nightly
pkgname=('rust-nightly' 'rust-nightly-doc')
pkgver=1.41.0_2019.11.18
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A safe, concurrent, practical language'
url='http://www.rust-lang.org/'
license=('MIT' 'Apache')
makedepends=('libffi' 'perl' 'python2' 'curl' 'llvm' 'cargo')
_src="https://static.rust-lang.org/dist/rustc-nightly-src.tar.xz"
source=($_src)
options=('staticlibs' '!strip' '!emptydirs' '!makeflags')
conflicts=('rust')
provides=('rust')
sha256sums=("$(curl -sL $_src.sha256 | cut -d\  -f1)")

export RUSTFLAGS="$RUSTFLAGS -C link-args=-lffi"

pkgver() {
  cd ${srcdir}/rustc-nightly-src
  ver="$(expr "$(cat version)" : '\(.*\)-nightly')"
  date="$(expr "$(cat version)" : '.* \(.*\))')"
  echo "${ver}_${date//\-/.}"
}

build() {
  cd rustc-nightly-src
 ./configure \
    --prefix=/usr \
    --release-channel=stable \
    --llvm-root=/usr \
    --disable-codegen-tests \
    --disable-rpath \
    --disable-compiler-docs 
}

package_rust-nightly() {
  depends=('shared-mime-info')
  optdepends=('rust-doc-git: language and API documentation')
  provides=('rust')
  conflicts=('rust')
  cd rustc-nightly-src

  DESTDIR="$pkgdir" python2 ./x.py install
  rm -fr "$pkgdir"/usr/share/doc/rust/html
  rm "$pkgdir"/usr/share/doc/rust/README.md
  rm -f "$pkgdir"/usr/lib/rustlib/{components,manifest-rustc,manifest-rust-docs,rust-installer-version,install.log,uninstall.sh}

  install -d "$pkgdir"/usr/share/licenses/rust-nightly/
  install -m644 COPYRIGHT LICENSE-* "$pkgdir"/usr/share/licenses/rust-nightly/
}

package_rust-nightly-doc() {
  pkgdesc="A safe, concurrent, practical language from Mozilla. (Language and API documentation)"
  arch=('any')
  optdepends=('rust-nightly: to compile and run the programs you can write using this documentation')
  provides=('rust-doc')
  conflicts=('rust-doc')

  cd rustc-nightly-src/src
  _docdir="$pkgdir"/usr/share/doc/rust
  install -d "$_docdir"
  cp -r doc/* "$_docdir"/ || true

  chmod -R 644 "$_docdir"
  find "$_docdir" -type d -exec chmod 755 {} +
  for ext in aux out log toc; do
          rm -f "$_docdir"/*."$ext"
  done
  cd ..
  install -d "$pkgdir"/usr/share/licenses/rust-nightly-doc/
  install -m644 COPYRIGHT LICENSE-* "$pkgdir"/usr/share/licenses/rust-nightly-doc/
}
