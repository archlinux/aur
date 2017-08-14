#Maintainer: nutz <nutz[äT]noova(O)de>
#Contributor: kiz <kiswono[äT]gmail(O)com>
#Contributor: truh <truhgoj[äT]truh(O)in>

pkgname=aerospike-server-ce
pkgver=3.14.0.2
pkgrel=1
pkgdesc="High performance NoSQL database"
arch=('x86_64' 'i686')
url="http://www.aerospike.com/"
license=('AGPLv3')
depends=('openssl-1.0')
source=("http://www.aerospike.com/download/server/${pkgver}/artifact/tgz"
        aerospike.service
       )
sha512sums=('d2be7c206328b7ee1b6b23a8c0a6caad22b1913b25c2e68f8993c472e6f15e92b73792296ed2de0f6677828347772c32c41682437513f333d9260aac49006280'
            '88829d7152fc2dfddb309c4aee96079243f3ee76f98a56adf2b0c6f9a91573bb7367740e1c7f5fc0c93386b3794b462b5792433e6d91e4a418fb5c3e8a23f986')
options=("!zipman")


#prepare() {}

#pkgver() {}

#build() {}

#check() {}

package() {
    ${srcdir}/aerospike-server/bin/aerospike init --home ${srcdir}/init/

    mkdir -p -m 755 "${pkgdir}/etc/"
    mkdir -p -m 755 "${pkgdir}/usr/bin/"
    mkdir -p -m 755 "${pkgdir}/usr/share/bin/"
    mkdir -p -m 755 "${pkgdir}/usr/share/etc/"
    mkdir -p -m 755 "${pkgdir}/usr/share/lib/"
    mkdir -p -m 755 "${pkgdir}/usr/share/libexec/"
    mkdir -p -m 755 "${pkgdir}/usr/share/udf/lua/external/"
    mkdir -p -m 755 "${pkgdir}/usr/share/udf/lua/ldt/"
    mkdir -p -m 755 "${pkgdir}/var/log"
    mkdir -p -m 755 "${pkgdir}/var/smd"
    mkdir -p -m 755 "${pkgdir}/var/udf/lua"

    cd ${srcdir}/init/

    cat << E=O=F > "bin/aerospike"
#!/bin/bash
cd /
. /etc/aerospike.rc
/usr/share/bin/aerospike \$*
E=O=F
    install -Dm755 bin/aerospike "${pkgdir}/usr/bin/aerospike"
    install -Dm755 bin/asd "${pkgdir}/usr/bin/asd"

    sed -e "s|${srcdir}/init||g" -i etc/aerospike.conf
    sed -e "s|/share/udf/lua|/usr/share/udf/lua|" -i etc/aerospike.conf
    install -Dm644 etc/aerospike.conf "${pkgdir}/etc/aerospike.conf"
    cat << E=O=F > "${pkgdir}/etc/aerospike.rc"
export AEROSPIKE_DAEMON=/usr/bin/asd
export AEROSPIKE_INST=1
export AEROSPIKE_CONF=/etc/aerospike.conf
E=O=F

    install -Dm755 share/bin/aerospike "${pkgdir}/usr/share/bin/aerospike"
    install -Dm644 share/etc/aerospike.conf "${pkgdir}/usr/share/etc/aerospike.conf"
    install -Dm644 share/lib/aerospike-render.py "${pkgdir}/usr/share/lib/aerospike-render.py"

    install -Dm755 share/libexec/aerospike-destroy "${pkgdir}/usr/share/libexec/aerospike-destroy"
    install -Dm755 share/libexec/aerospike-init "${pkgdir}/usr/share/libexec/aerospike-init"
    install -Dm755 share/libexec/aerospike-restart "${pkgdir}/usr/share/libexec/aerospike-restart"
    install -Dm755 share/libexec/aerospike-start "${pkgdir}/usr/share/libexec/aerospike-start"
    install -Dm755 share/libexec/aerospike-status "${pkgdir}/usr/share/libexec/aerospike-status"
    install -Dm755 share/libexec/aerospike-stop "${pkgdir}/usr/share/libexec/aerospike-stop"

    install -Dm755 share/man/aerospike-init.man "${pkgdir}/usr/share/man/aerospike-init.man"
    install -Dm755 share/man/aerospike-destroy.man "${pkgdir}/usr/share/man/aerospike-destroy.man"
    install -Dm755 share/man/aerospike-restart.man "${pkgdir}/usr/share/man/aerospike-restart.man"
    install -Dm755 share/man/aerospike-start.man "${pkgdir}/usr/share/man/aerospike-start.man"
    install -Dm755 share/man/aerospike-status.man "${pkgdir}/usr/share/man/aerospike-status.man"
    install -Dm755 share/man/aerospike-stop.man "${pkgdir}/usr/share/man/aerospike-stop.man"

    install -Dm755 share/udf/lua/external/llist.lua "${pkgdir}/usr/share/udf/lua/external/llist.lua"
    install -Dm755 share/udf/lua/external/lmap.lua "${pkgdir}/usr/share/udf/lua/external/lmap.lua"
    install -Dm755 share/udf/lua/external/lset.lua "${pkgdir}/usr/share/udf/lua/external/lset.lua"
    install -Dm755 share/udf/lua/external/lstack.lua "${pkgdir}/usr/share/udf/lua/external/lstack.lua"

    install -Dm755 share/udf/lua/ldt/CRC32.lua "${pkgdir}/usr/share/udf/lua/ldt/CRC32.lua"
    install -Dm755 share/udf/lua/ldt/ldt_common.lua "${pkgdir}/usr/share/udf/lua/ldt/ldt_common.lua"
    install -Dm755 share/udf/lua/ldt/ldt_errors.lua "${pkgdir}/usr/share/udf/lua/ldt/ldt_errors.lua"
    install -Dm755 share/udf/lua/ldt/lib_llist.lua "${pkgdir}/usr/share/udf/lua/ldt/lib_llist.lua"
    install -Dm755 share/udf/lua/ldt/lib_lmap.lua "${pkgdir}/usr/share/udf/lua/ldt/lib_lmap.lua"
    install -Dm755 share/udf/lua/ldt/lib_lset.lua "${pkgdir}/usr/share/udf/lua/ldt/lib_lset.lua"
    install -Dm755 share/udf/lua/ldt/lib_lstack.lua "${pkgdir}/usr/share/udf/lua/ldt/lib_lstack.lua"

    install -Dm755 share/udf/lua/aerospike.lua "${pkgdir}/usr/share/udf/lua/aerospike.lua"
    install -Dm755 share/udf/lua/as.lua "${pkgdir}/usr/share/udf/lua/as.lua"
    install -Dm755 share/udf/lua/stream_ops.lua "${pkgdir}/usr/share/udf/lua/stream_ops.lua"

    # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Systemd
    install -m755 -d ${pkgdir}/usr/lib/systemd/system || return 1
    install -m644  $startdir/aerospike.service ${pkgdir}/usr/lib/systemd/system || return 1
}
