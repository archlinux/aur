# Maintainer SimPilotAdamT <adam_tazul@outlook.com>

pkgname=vmware-unlocker
pkgver=4.2.1
pkgrel=15
pkgdesc="VMware macOS utilities"
arch=('x86_64')
url="https://github.com/DrDonk/unlocker"
license=('MIT')
#depends=('vmware-workstation>=16.0.0')
makedepends=("git" "zsh" "go")
conflicts=('vmware-unlocker-bin' 'vmware-unlocker-git')
source=("$pkgname::git+https://github.com/DrDonk/unlocker#tag=v$pkgver" "vmware-unlocker-post.hook" "vmware-unlocker-pre.hook")
sha512sums=('SKIP'
  '9562d829c593d45fd77eee19652b30ef3c33b0c67057b7e3fb4d39695d6b39659ddc06f64d0325ea02a400121a050e2bd0858a606e2a6627a40af8e87c8a378b'
  'c95c021915665fbda50c4ce739b76d92c0616d102e05033aa5b4e0ebd933e61b775ffb6ef0cf65eaf392958b8bb4125932c3cf49dd705ebb6f43cc121eccb0b3'
)
build() {
  mkdir "$srcdir/go-winres/"
  env GOBIN="$srcdir/go-winres/" go install github.com/tc-hib/go-winres@latest
  cd "$srcdir/$pkgname/"
  env PATH="$PATH:$srcdir/go-winres/" zsh build.sh "$pkgver"
}
package() {
  mkdir -p "$pkgdir/usr/bin/iso/"
  mkdir -p "$pkgdir/usr/backup/"
  mkdir -p "$pkgdir/etc/pacman.d/hooks/"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm755 "$srcdir/$pkgname/dist/linux/*" "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/$pkgname/dist/iso/*" "$pkgdir/usr/bin/iso/"
  install -Dm644 "$srcdir/*.hook" "$pkgdir/etc/pacman.d/hooks/"
  install -Dm644 "$srcdir/$pkgname/dist/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
