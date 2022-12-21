# Maintainer SimPilotAdamT <adam_tazul@outlook.com>

pkgname=vmware-unlocker
pkgver=4.2.4
pkgrel=1
pkgdesc="VMware macOS utilities"
arch=("x86_64")
url="https://github.com/DrDonk/unlocker"
license=('MIT')
depends=("vmware-workstation>=16.0.0" "bash")
makedepends=("git" "go")
conflicts=("vmware-unlocker-bin" "vmware-unlocker-git")
source=("$pkgname::git+$url#tag=v$pkgver" "vmware-unlocker-post.hook" "vmware-unlocker-pre.hook")
sha512sums=("SKIP"
  "3c22eb82eb02a1bee88a50f8ffcf71bd60679f53540325f56d7865c32f229dfdc02fde34a9a6f0d8f1bc8eae078c21149a2f6e3cbd6f233db1fe34296839865a"
  "68990bed2f93f7ee7b648270af8304044b8ae33bb295fa9418edc6728676d94a5443843d63f01c31c99a7381fb822fad06ed052b6eb7ae92e91e9bed8dbe1302"
)

build() {
  cd "$srcdir/$pkgname/"
  sed -e '/winres/ s/^#*/#/; /exe/ s/^#*/#/; /syso/ s/^#*/#/' -i build.sh
  bash build.sh "$pkgver"
}

package() {
  mkdir -p "$pkgdir/usr/iso/"
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/backup/"
  mkdir -p "$pkgdir/etc/pacman.d/hooks/"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm755 "$srcdir/$pkgname/dist/linux/"* "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/$pkgname/dist/iso/"* "$pkgdir/usr/iso/"
  install -Dm644 "$srcdir/"*.hook "$pkgdir/etc/pacman.d/hooks/"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
