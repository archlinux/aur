# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

_sed_args=(-e 's|/var/service|/run/runit/service|g' -e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=nldev-runit
pkgver=20181226
pkgrel=1
pkgdesc="runit service scripts for nldev"
arch=('any')
license=('MIT/X')
depends=('nldev' 'runit')
source=("nldev.run"
        "nldev.conf"
        "nltrigger.run")
sha256sums=('cec0065df70a4f1416cfb2e55d62ce006244ff99e102b4928cf8637c9ab38f7f'
            '970bc31081ea9a46f6b03d5f593a18920b830da5d7dc8e625566dffbb05362e2'
            '08e171df7501cbd7dbd5ef820bed5f4e572fb28cc64daa05bc83144d77aa1a5e')

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
}
