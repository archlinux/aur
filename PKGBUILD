# Maintainer: Jat <chat@jat.email>

_pkgname=redis
pkgname=redis-bin
pkgver=8.0.1
pkgrel=1
pkgdesc='An in-memory database that persists on disk.'
arch=('x86_64' 'aarch64')
url='https://redis.io'
license=('RSALv2' 'SSPLv1' 'AGPLv3')
provides=("$_pkgname")
conflicts=("$_pkgname")
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
sha256sums_x86_64=('8958733a0170e48abc7acc7efe0df8f1e23ca4a48f5825efa43743ebbe0f8db0'
                   'fb81b335495883f61c94ce3aef319b3ec299900fec376b31ad6915d85bec8c9f'
                   '0ddd06d7b0220d28fa062e6354e0f7546cceaebfad5bb0cfa0d5f51fb2cd340f')
sha256sums_aarch64=('847fece45ee37f12492f743837272c850531a9ffea3e560052954703c2609c8f'
                    '24a5563fc35f80a50f12701972ff6a560821ef1ba85defacf52470d26cb34d28'
                    '3d58d7e8521c28aa0c3f0cc9c56dbd7984666910a4a0f542703f6c80fd2db0bc')

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
