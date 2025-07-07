# Maintainer: Jat <chat@jat.email>

_pkgname=redis
pkgname=redis-bin
pkgver=8.0.3
pkgrel=1
pkgdesc='An in-memory database that persists on disk.'
arch=('x86_64' 'aarch64')
url='https://redis.io'
license=('RSALv2' 'SSPLv1' 'AGPLv3')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('glibc' 'jemalloc' 'openssl' 'systemd-libs')
makedepends=('libarchive')
backup=(
    'etc/redis/redis.conf'
    'etc/redis/sentinel.conf'
    'etc/default/redis-server'
    'etc/default/redis-sentinel'
    'etc/logrotate.d/redis-server'
    'etc/logrotate.d/redis-sentinel'
)

_deb_url_prefix='https://packages.redis.io/deb/pool/noble/r/re/redis'
_deb_codename='1rl1~noble1'
source=(
    "https://github.com/redis/redis/raw/refs/tags/$pkgver/LICENSE.txt"
    'redis.sysusers'
    'redis.tmpfiles'
)
source_x86_64=("${_deb_url_prefix}-"{sentinel,server,tools}"_$pkgver-${_deb_codename}_amd64.deb")
source_aarch64=("${_deb_url_prefix}-"{sentinel,server,tools}"_$pkgver-${_deb_codename}_arm64.deb")
noextract=("${source_x86_64[@]##*/}" "${source_aarch64[@]##*/}")
sha256sums=('4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40'
            '5f66305c49ba5ed67e777336e0a193c1d2b8ac7ba20a3e3cf0764804b60601f8'
            'e75e37458c8774ca1c01290e211a8805c6fd83bd1d5f8fe8b1907a9ae59d4e49')
sha256sums_x86_64=('842c194eda22d596b1ef5c63cf3fa02b3db8af28d0f1b4283e6cd27c7496bd43'
                   '774c01ee066e6342ca5954a2e7f807cb2316491f9039cdd94cbaddd4157a85dc'
                   '908f4a704f606466d2c70f2fbb9a272b7ace57e880fea5a1ed62325413bd911b')
sha256sums_aarch64=('9d0f2207144544a58c1f49a590dc9eb44a61a512728cfaa9edf2a7b351999c8b'
                    '2b56cff40af73303e008f5c82b3b021026dec4b0eb4a8ae71c8a4c7b6e7b4a1a'
                    'cf42f5dccb138af6f6f39f50c5db3565d7208e38fbe88636d238d31e719a7157')

prepare() {
    cd "$srcdir"

    for deb in *.deb; do
        mkdir "${deb%%_*}"
        bsdtar -xf "$deb" -C "${deb%%_*}" data.tar.zst
    done

    for zst in */data.tar.zst; do
        bsdtar -xf "$zst" -C "${zst%/*}"
        rm "$zst"
    done
}

package() {
    cd "$srcdir"

    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/redis/LICENSE

    install -Dm644 -t "$pkgdir"/etc/default redis-{sentinel,server}/etc/default/*
    install -Dm644 -t "$pkgdir"/etc/logrotate.d redis-{sentinel,server}/etc/logrotate.d/*
    install -Dm644 -t "$pkgdir"/etc/redis redis-{sentinel,server}/etc/redis/*

    mkdir -p "$pkgdir"/usr/bin
    cp -a -t "$pkgdir"/usr/bin redis-{sentinel,server,tools}/usr/bin/*

    install -Dm755 -t "$pkgdir"/usr/lib/redis/modules redis-server/usr/lib/redis/modules/*
    install -Dm644 -t "$pkgdir"/usr/lib/systemd/system redis-{sentinel,server}/usr/lib/systemd/system/*
    install -Dm644 -t "$pkgdir"/usr/share/bash-completion/completions redis-tools/usr/share/bash-completion/completions/*

    install -Dm644 "$srcdir"/redis.sysusers "$pkgdir"/usr/lib/sysusers.d/redis.conf
    install -Dm644 "$srcdir"/redis.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/redis.conf
}
