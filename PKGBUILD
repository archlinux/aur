# Maintainer: Shadowbee <shadowbee.contact@proton.me>
# Maintainer: Eldred Habert <arch@(my first name).fr>
pkgname=hister-bin
pkgver=0.19.0
pkgrel=3
pkgdesc="Web history on steroids - blazing fast, content-based search for visited websites"
arch=('x86_64' 'aarch64')
provides=(hister)
conflicts=(hister hister-git)
url="https://github.com/asciimoo/hister"
license=('AGPL-3.0-or-later')
# makedepends=('go' 'npm')
optdepends=('postgresql: For an alternate database')
install=hister.install
options=(!lto)
source=(hister.override.service
        systemd-user.patch
        hister.sysusers
        "LICENSE-$pkgver::https://raw.githubusercontent.com/asciimoo/hister/refs/tags/v$pkgver/LICENSE"
        "hister-$pkgver.service::https://raw.githubusercontent.com/asciimoo/hister/refs/tags/v$pkgver/contrib/systemd/hister.service")
sha256sums=('f5713114859925e53bd9f99d26072bcf07946011545d1e69fbaf09a7623e7e23'
            'ef2a171ba6f78978aaafc06e41407ea6c80712a806f0f514c7c7e1215481bdf2'
            '5f4f3e82c42ba517d0caaa1deb4d3532c4f26cc60e42861bff1c5c6dacf34e9f'
            '57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6'
            '1515b5a31e1a3c21a1ebe9727782ef9ba7ec8e1c3da4a5de04a5c81fd1413778')
sha256sums_x86_64=('7571f7b94039917d519372fa6aff18fe12c2ef50f981ac847ec1aff4d7e41701')
sha256sums_aarch64=('7571f7b94039917d519372fa6aff18fe12c2ef50f981ac847ec1aff4d7e41701')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/hister_${pkgver}_linux_amd64")
source_aarch64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/hister_${pkgver}_linux_arm64")
backup=(etc/hister/{hister.env,config.yml})

build() {
  chmod +x hister-bin-$pkgver

  for _shell in bash zsh fish; do
    ./hister-bin-$pkgver completion $_shell > hister.$_shell
  done

  # We install in a location suitable for vendor installs.
  sed -i 's,/usr/local/,/usr/,g' hister-$pkgver.service
  # Create a separate user service file (taking in the above modification).
  cp hister{-$pkgver,-user}.service
  patch --force --forward -p3 <"$srcdir/systemd-user.patch"

  ./hister-bin-$pkgver create-config >config.yml
}

package() {
  install -Dsm755 hister-bin-$pkgver "$pkgdir/usr/bin/hister"
  install -Dm644 hister-$pkgver.service     "$pkgdir/usr/lib/systemd/system/hister.service"
  install -Dm644 hister.override.service    "$pkgdir/usr/lib/systemd/system/hister.service.d/00-arch.conf"
  install -Dm644 hister-user.service        "$pkgdir/usr/lib/systemd/user/hister.service"
  install -Dm644 hister.override.service    "$pkgdir/usr/lib/systemd/user/hister.service.d/00-arch.conf"
  sed -i 's/DynamicUser=.*/DynamicUser=no/' "$pkgdir/usr/lib/systemd/user/hister.service.d/00-arch.conf"
  install -Dm644 LICENSE-$pkgver "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 /dev/null  "$pkgdir/etc/hister/hister.env"
  install -Dm644 config.yml "$pkgdir/etc/hister/config.yml"

  install -Dm644 hister.bash "$pkgdir/usr/share/bash-completion/completions/hister"
  install -Dm644 hister.zsh  "$pkgdir/usr/share/zsh/site-functions/_hister"
  install -Dm644 hister.fish "$pkgdir/usr/share/fish/vendor_completions.d/hister.fish"
}
