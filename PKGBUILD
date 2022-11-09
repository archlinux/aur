# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>

pkgname=plume
_pkgname=Plume
pkgver=0.7.2
pkgrel=1
pkgdesc='Federated blogging application'
arch=(x86_64)
url='https://joinplu.me/'
license=(AGPL3)
depends=(openssl)
makedepends=(rustup wasm-pack)
optdepends=('postgresql: postgresql support'
	    'sqlite3: sqlite support')
backup=('etc/plume/config')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Plume-org/Plume/archive/refs/tags/${pkgver}.tar.gz"
        "plume.sysusers"
        "plume.service"
        ".env.sample")
install=$pkgname.install
md5sums=('75d75d08656f707c1ea7b55ce34d8102'
         'ebfcfb05844a25ff281317af9b64f8bb'
         'd7d282ac020ebf59c7c56b31b41160ef'
         '939c960f67f2b859b48f96223bd6b74e')

prepare(){
  cd $_pkgname-$pkgver
  sed -i '$a\\n' Cargo.toml
  sed -i '$a\[package.metadata.wasm-pack.profile.release]' Cargo.toml
  sed -i '$a\wasm-opt = false' Cargo.toml
}

build() {
  cd $_pkgname-$pkgver
  # build the font-end
  rustup target add wasm32-unknown-unknown
  #env PATH=$HOME/.cargo/bin/:$PATH wasm-pack build --target web --release plume-front
  wasm-pack build --target web --release plume-front

  # build the back-end
  cargo install --no-default-features --features postgres --path .
  cargo install --no-default-features --features postgres --path plume-cli

}

package() {
  # config files
  install $srcdir/.env.sample "$pkgdir"/etc/plume/config
  ln -s "/usr/share/webapps/plume/.env" "$pkgdir/etc/plume/config"

  # systemd related
  install -Dm644 "plume.sysusers" "$pkgdir/usr/lib/sysusers.d/plume.conf" 
  install -Dm644 "plume.service" "$pkgdir/usr/lib/systemd/system/plume.service"

  cd $_pkgname-$pkgver

  # binary 
  install -Dm755 "target/release/plume" "$pkgdir/usr/bin/plume"
  install -Dm755 "target/release/plm" "$pkgdir/usr/bin/plm"
  ln -s /usr/bin/plume $pkgdir/usr/share/webapps/plume
  ln -s /usr/bin/plm $pkgdir/usr/share/webapps/plm

  # webpage
  cp -r "static" "$pkgdir/usr/share/webapps/plume"

}
