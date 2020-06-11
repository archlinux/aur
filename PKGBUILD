# Maintainer: DuckSoft <realducksoft at gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=ventoy-bin
pkgver=1.0.12
pkgrel=3
pkgdesc='A new multiboot USB solution (Binary)'
url='http://www.ventoy.net/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('bash' 'util-linux' 'xz' 'exfat-utils')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/ventoy/Ventoy/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.tar.gz"
        "${pkgname%-bin}" 'sanitize.patch')
sha512sums=('b89c4de490ec7af8358c98c7613ba2cb91e42c2db0c7e541ac62e1b3d9dfb7ff2d7550c72a71e52b0e27f7b030053e62b1b3bde3ed93fe7b00be78d4abe00865'
            '578859c4007e406e66cd5331d9ce90794cf04cd9a4b252f8188e4f8d4cbd60ae1efb09860952ffb6540552db772e36baf6acded69bf0b0a6569f374215e166bc'
            'be2b02c4272ff2d24a9c939ace2e92e9fa725fd2ac14996a10e767442cdce5b4b51e7d221bfedfb18a9081c1957bcf11c46a4152b3fb7dd055943b0a2ebb9753')

prepare() {
  msg2 "Decompress tools..."
  cd "$srcdir/${pkgname%-bin}-${pkgver}/tool"
  for file in $(ls *.xz); do
    xzcat $file > ${file%.xz}
    chmod +x ${file%.xz}
  done
  
  msg2 "Cleaning up .xz crap..."
  rm -fv ./*.xz
  
  msg2 "Applying sanitize patch..."
  cd ..
  patch -p0 < "$srcdir/sanitize.patch"
  
  msg2 "Cleaning up unused binaries..."
  rm -fv tool/{mkextfatfs_{32,64},mount.exfat-fuse_{32,64},ash,hexdump,xzcat}
}

package() {
  cd "$srcdir/${pkgname%-bin}-${pkgver}"

  msg2 "Copying package files..."
  install -Dm644 -t "$pkgdir/opt/${pkgname%-bin}/boot/"            boot/*
  install -Dm644 -t "$pkgdir/opt/${pkgname%-bin}/${pkgname%-bin}/" "${pkgname%-bin}"/* 
  install -Dm755 -t "$pkgdir/opt/${pkgname%-bin}/tool/"            tool/*
  install -Dm755 -t "$pkgdir/opt/${pkgname%-bin}/"                 *.sh
  
  msg2 "Linking system binaries..."
  ln -svf /usr/bin/xzcat   "$pkgdir/opt/${pkgname%-bin}/tool/"
  ln -svf /usr/bin/hexdump "$pkgdir/opt/${pkgname%-bin}/tool/"
  ln -svf /usr/bin/mkfs.exfat "$pkgdir/opt/${pkgname%-bin}/tool/mkextfatfs_32"
  ln -svf /usr/bin/mkfs.exfat "$pkgdir/opt/${pkgname%-bin}/tool/mkextfatfs_64"
  ln -svf /usr/bin/mount.exfat-fuse "$pkgdir/opt/${pkgname%-bin}/tool/mkextfatfs_32"
  ln -svf /usr/bin/mount.exfat-fuse "$pkgdir/opt/${pkgname%-bin}/tool/mkextfatfs_64"
  
  msg2 "Creating /usr/bin entries..."
  install -Dm755 "$srcdir/${pkgname%-bin}" -t "$pkgdir"/usr/bin/
}
