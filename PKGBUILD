# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

_sed_args=(-e 's|/var/service|/run/runit/service|g' -e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=nldev-runit
pkgver=20210602
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
sha256sums=('811ac122ce19056b4d87588f3aed9a490cc5590dd13d4004760534108479b8a0'
            '970bc31081ea9a46f6b03d5f593a18920b830da5d7dc8e625566dffbb05362e2'
            '08e171df7501cbd7dbd5ef820bed5f4e572fb28cc64daa05bc83144d77aa1a5e'
            '538804d8f2d042d6a1dde2dd657711328baeddfdca80b68ea9583580033ee060'
            '079b80e78135ad0097f83a52b321262fe8c3f3f37a4526ba9b256512ea86bf97')

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
    ln -sf /usr/lib/rc/sv.d/nltrigger ${pkgdir}/etc/rc/shutdown/31-nltrigger
}
