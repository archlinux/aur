# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

_sed_args=(-e 's|/var/service|/run/runit/service|g' -e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=nldev-runit
pkgver=20210913
pkgrel=1
pkgdesc="runit service scripts for nldev"
arch=('any')
license=('MIT/X')
depends=('nldev' 'runit')
source=("nldev.run"
        "nldev.conf"
        "nltrigger.run"
        "nldev.early"
        "nltrigger.early")
sha256sums=('a5d3b4faeb2033f26e09e30238f0bd9aad4bd0170008c7324294dd5252e4133e'
            '4aa815aa1fd06c6f794cc00bf21d9d808ce2137c5e4a77bac8ef7e9d20083809'
            'cad0f0842390c60c985daf86da80a8c64a44f03cd9bb465e777380ed5ac9f1f7'
            'ee667ba8d060325b2e524955320e34d32a9919b6fb016b1266aaf7c1e3b99e86'
            '0e9b7c35e4cc2a984f259643ad10496dd928468ed1374f92ee20eef63213f243')

_inst_sv() {
    if test -f "$srcdir/$1.conf"; then
        install -Dm644 "$srcdir/$1.conf" "$pkgdir/etc/runit/sv/$1/conf"
    fi

    for file in run finish check; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/runit/sv/$1/$file"
            sed "${_sed_args[@]}" -i "$pkgdir/etc/runit/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'nldev'
    _inst_sv 'nltrigger'

    install -Dm755 "${srcdir}/nldev.early" "${pkgdir}/usr/lib/rc/sv.d/nldev"
    install -Dm755 "${srcdir}/nltrigger.early" "${pkgdir}/usr/lib/rc/sv.d/nltrigger"
    install -d ${pkgdir}/etc/rc/{sysinit,shutdown}
    ln -sf /usr/lib/rc/sv.d/nldev ${pkgdir}/etc/rc/sysinit/30-nldev
    ln -sf /usr/lib/rc/sv.d/nldev ${pkgdir}/etc/rc/shutdown/30-nldev
    ln -sf /usr/lib/rc/sv.d/nltrigger ${pkgdir}/etc/rc/sysinit/31-nltrigger
}
