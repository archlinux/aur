# Maintainer: Kuan-Yen Chou <forendef2846 at gmail dot com>

pkgbase=shifter-slurm-git
pkgname=('shifter-slurm-runtime-git' 'shifter-slurm-imagegw-git')
pkgver=20170801
pkgrel=1
pkgdesc='NERSC Shifter: Linux Containers for HPC (with SLURM support)'
makedepends=('gcc' 'glibc' 'make' 'autoconf' 'automake' 'libtool' 'libcap' 'munge' 'json-c' 'slurm-llnl')
arch=('x86_64')
url="https://github.com/NERSC/shifter"
license=('BSD')
source=("git+https://github.com/NERSC/shifter.git"
        'build_ssh.patch'
        'shifter-runtime.conf'
        'shifter-imagegw.conf'
        'shifter-imagegw.service'
        'start-imagegw.sh')
sha512sums=('SKIP'
            'bcb8da45ba803f40a76902961b86783d2399732272d68554dd75e09115958c9d1cf5c8d9d6d1f0db406d36a16e404500c47fa40c70d4f17ab0c6b7d94cd28f06'
            '8df5449ea93988364e8c350a2652e661545d883fada2f589b944cc7a2bd0d34b494f31e0f63bb0aea9c82e2805b4c9393b2290575dd14497fcd873b286d51b36'
            'c56ad3b92901abdb41cffaeceeff9a6c8dae3882aacf9a4b654a8898f1e26eeadda3ac3ac799b127b176cc31d397652f27a07bcdfbf7f4ede3c6826d08f7bd7d'
            'daf8163025a5d4099dc64cab8bab57d0b1a4101f04c563b5b03521b386d87581565d0e03c2fb3a02d791daff16cfb139244cc6bd7a886661e3caa0d107a7cb0a'
            'afd15fb203ccf76ebb2a3542cbbde216f9f988752808479f25292ef4d9949a793070eead996072b564fe19dec6c33da72be21c1732a0e7d5817b30e7306d65e3')

prepare() {
    cd "${srcdir}/shifter"
    patch -p0 < ../build_ssh.patch
}

build() {
    cd "${srcdir}/shifter"
    export PYTHON=/usr/bin/python2
    ./autogen.sh
    ./configure \
        --prefix=/usr             \
        --sbindir=/usr/bin        \
        --sysconfdir=/etc/shifter \
        --with-json-c             \
        --with-libcurl            \
        --with-munge              \
        --with-slurm=/usr
    make
}

package_shifter-slurm-runtime-git() {
    depends=('munge' 'curl' 'pam' 'squashfs-tools'
             'json-c' 'xfsprogs' 'wget' 'slurm-llnl')
    install="${pkgname}.install"
    provides=('shifter-runtime')
    conflicts=('shifter-runtime' 'shifter-slurm-runtime' 'shifter-runtime-git')
    cd "${srcdir}/shifter"
    make DESTDIR="${pkgdir}" install
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 ../shifter-runtime.conf -t "${pkgdir}/etc/modules-load.d"
    rm -rf "${pkgdir}/etc/shifter/shifter_etc_files/group"
    rm -rf "${pkgdir}/etc/shifter/shifter_etc_files/passwd"
    rm -rf "${pkgdir}/etc/shifter/imagemanager.json.example"
    rm -rf "${pkgdir}/usr/lib"
    rm -rf "${pkgdir}/usr/libexec/shifter/imagecli.py"
    rm -rf "${pkgdir}/usr/libexec/shifter/imagegwapi.py"
    rm -rf "${pkgdir}/usr/libexec/shifter/sitecustomize.py"
    rm -rf "${pkgdir}/usr/share/shifter"
}

package_shifter-slurm-imagegw-git() {
    depends=('munge' 'curl' 'pam' 'squashfs-tools'
             'mongodb' 'redis' 'jq' 'slurm-llnl'
             'python2-celery' 'python2-pymongo' 'python2-flask'
             'python2-redis' 'gunicorn-python2' 'python2-pylint')
    install="${pkgname}.install"
    provides=('shifter-imagegw')
    conflicts=('shifter-imagegw' 'shifter-slurm-imagegw' 'shifter-imagegw-git')
    cd "${srcdir}/shifter"
    make DESTDIR="${pkgdir}" install
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 imagegw/*{.py,.sh,.yml,.json} -t "${pkgdir}/opt/shifter/imagegw/"
    install -Dm 755 ../start-imagegw.sh -t "${pkgdir}/opt/shifter/imagegw"
    install -Dm 644 ../shifter-imagegw.service -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm 644 ../shifter-imagegw.conf -t "${pkgdir}/etc/modules-load.d"
    rm -rf "${pkgdir}/etc/shifter/udiRoot.conf.example"
    rm -rf "${pkgdir}/etc/shifter/shifter_etc_files"
    rm -rf "${pkgdir}/usr/bin"
    rm -rf "${pkgdir}/usr/libexec/shifter/mount"
    rm -rf "${pkgdir}/usr/libexec/shifter/opt"
    rm -rf "${pkgdir}/usr/libexec/shifter/shifter_slurm_dws_support"
    rm -rf "${pkgdir}/usr/share/shifter"
}

# vim: set ts=4 sw=4 et :
