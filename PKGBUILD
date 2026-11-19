# Maintainer: Shadowbee <shadowbee.contact@proton.me>
# Maintainer: Eldred Habert <arch@(my first name).fr>
pkgname=nogon-bin
pkgver=0.22.0
pkgrel=1
pkgdesc="Web history on steroids - blazing fast, content-based search for visited websites"
arch=('x86_64' 'aarch64')
provides=(nogon)
conflicts=(hister hister-git nogon nogon-git)
replaces=(hister-bin)
url="https://github.com/asciimoo/nogon"
license=('AGPL-3.0-or-later')
# makedepends=('go' 'npm')
optdepends=('postgresql: For an alternate database')
install=nogon.install
options=(!lto)
source=(nogon.override.service
    systemd-user.patch
    nogon.sysusers
    "LICENSE-$pkgver::https://raw.githubusercontent.com/asciimoo/nogon/refs/tags/v$pkgver/LICENSE"
    "nogon-$pkgver.service::https://raw.githubusercontent.com/asciimoo/nogon/refs/tags/v$pkgver/contrib/systemd/hister.service")
sha256sums=('56b7667ad2585bd9354991cf6d30a994b9e10d80d74747a4cbc13dc58b02d924'
    '94aa280a09217e1d554b4fe799ebf9174e04dee594fb21f039d95b1d044821a7'
    'e4d388c70dfb03232a5861c0371e7f9baf719fb3827e5daf8debcae451468fd6'
    '57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6'
    'cd623e88f5391ede1d8a498c71c05799f94746ee0c8b960e3a8552d6e05820a2')
sha256sums_x86_64=('e358b54b5e80e144e63ae600584953cbdaa52096812c896d94ac91078e7aad41')
sha256sums_aarch64=('e358b54b5e80e144e63ae600584953cbdaa52096812c896d94ac91078e7aad41')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/nogon_${pkgver}_linux_amd64")
source_aarch64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/nogon_${pkgver}_linux_arm64")
backup=(etc/hister/{hister.env,config.yml})

prepare() {

    # We install in a location suitable for vendor installs.
    sed -i 's,/usr/local/,/usr/,g' nogon-$pkgver.service
    # Create a separate user service file (taking in the above modification).
    cp nogon{-$pkgver,-user}.service

    patch --force --forward -p3 <"$srcdir/systemd-user.patch"
}

build() {
    chmod +x nogon-bin-$pkgver

    for _shell in bash zsh fish; do
        ./nogon-bin-$pkgver completion $_shell >nogon.$_shell
    done

    ./nogon-bin-$pkgver config create >config.yml
}

package() {
    install -Dsm755 nogon-bin-$pkgver "$pkgdir/usr/bin/nogon"
    install -Dm644 nogon-$pkgver.service "$pkgdir/usr/lib/systemd/system/nogon.service"
    install -Dm644 nogon.override.service "$pkgdir/usr/lib/systemd/system/nogon.service.d/00-arch.conf"
    install -Dm644 nogon-user.service "$pkgdir/usr/lib/systemd/user/nogon.service"
    install -Dm644 nogon.override.service "$pkgdir/usr/lib/systemd/user/nogon.service.d/00-arch.conf"
    sed -i 's/DynamicUser=.*/DynamicUser=no/' "$pkgdir/usr/lib/systemd/user/nogon.service.d/00-arch.conf"
    install -Dm644 LICENSE-$pkgver "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 /dev/null "$pkgdir/etc/hister/hister.env"
    install -Dm644 config.yml "$pkgdir/etc/hister/config.yml"

    install -Dm644 nogon.bash "$pkgdir/usr/share/bash-completion/completions/nogon"
    install -Dm644 nogon.zsh "$pkgdir/usr/share/zsh/site-functions/_nogon"
    install -Dm644 nogon.fish "$pkgdir/usr/share/fish/vendor_completions.d/nogon.fish"
}
