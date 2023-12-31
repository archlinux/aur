# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: <thysupremematrix at tuta dot io>
# Contributor: Pekka Helenius <fincer89@hotmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Pulphix <crimea.v@libero.it>

pkgname=gamin
pkgname+=-git
pkgver=0.1.10.6.r1.g08a6371
pkgrel=1
pkgdesc='File and directory monitoring system defined to be a subset of the FAM (File Alteration Monitor)'
pkgdesc+=' [git version]'
#url='http://www.gnome.org/~veillard/gamin'
#url='https://people.gnome.org/~veillard/gamin'
#url='https://web.archive.org/web/20141226011517/https://people.gnome.org/~veillard/gamin'
url="https://download.gnome.org/sources/${pkgname}/"
license=('GPL')
arch=('x86_64' 'i686')
depends=('glib2')
makedepends=('python')
optdepends=('python: for the python module')
provides=('fam')
conflicts=('fam')
_pkgver="${pkgver%.r*}"; _pkgver="${_pkgver%.*}"
_srcdir="${pkgname%-git}-${_pkgver}"
source=("${url}/${_pkgver%.*}/${pkgname%-git}-${_pkgver}.tar.gz"
        'fix-deprecated-const.patch'
        '18_gam_server_deadlocks.patch'
        '0001-Poll-files-on-nfs4.patch'
        'https://raw.githubusercontent.com/Fincer/gamin-python3/master/code/patch_python3.patch')
md5sums=('b4ec549e57da470c04edd5ec2876a028'
         'f679aeb48fe9dd376c8828cc9b6941ab'
         '4784359a3206bfa3c0dce1c23468f87f'
         '6711cd0b1e8d2ad038c5761715d084a5'
         'e6c9583b8d52caab80830d34bc0d48d9')
sha256sums=('28085f0ae8be10eab582ff186af4fb0be92cc6c62b5cc19cd09b295c7c2899a1'
            '33af6c9a94b459506fc48892c169d89cb4ad7c68e160f0c4bc74475f19ce5a2f'
            'c67d26e26b1d9e0734758565fed6d09c725ab7fdec8325ab03bd5bbef95da8f8'
            '731603093d4831ddcdebb27171a294c8b03a000b44f3c5bca7472074f2f799a1'
            '48f4ae85eb7df4169e655778af3daa9c38961e03bb2989317b3dfbf322eaceb4')
sha512sums=('21bfe6fcf8fb3117cd5a08c8ce3b8d0d1dd23e478e60a95b76c20d02cc29b050dde086578d81037990484ff891c3e104d2cbbf3d294b4a79346b14a0cae075bb'
            'c4c10bee70c7231db395cbfe5bdf513ade6be599a11a9d35888ddfaca42d619fe2b5e87c2b2bab469ea98ba718bc01711252313ba5f53c392379b669f5b2902b'
            'ae2d3f3cd16e2da05836cbb2f21527896db5d5067ef4b120e943693234a685527eff528955ed80120265ca70e04a88cc28413cc34311d6faa068c620339fad38'
            'dcb23fd68e106a1b578235ef0b01b49773908ca6ded706610103f880f77a2aa0b0403cb720b9c6b062bac71e9d66cd2288b489c558839fc23295b18635bf399f'
            'dc2f3707c22442b0ae1a19fbfd1699a42074ead4ae4033638fd20d63d51a06e2f6f701d54743611fbca8dee34195920fc96701e9fa569775f8a536e9e8805b12')

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  url='https://salsa.debian.org/gnome-team/gamin'
  source[0]="git+${url}.git"
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  sha512sums[0]='SKIP'
  makedepends+=('git')
  provides+=("gamin=${pkgver#.r*}")
  conflicts+=('gamin')
  _srcdir="${pkgname%-git}"
pkgver(){
  cd "${_srcdir}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s@.*/@@'
}
else
pkgver() {
  printf '%s\n' "${pkgver%.r*}"
}
fi

prepare() {
  cd "${_srcdir}"

  # https://bugs.archlinux.org/task/33642
  patch -Np1 -i ../18_gam_server_deadlocks.patch

  patch -Np1 -i ../fix-deprecated-const.patch
  patch -Np1 -i ../0001-Poll-files-on-nfs4.patch

  # python 2
  #sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' python/gamin.py

  patch -Np1 -i ../patch_python3.patch
}

build() {
  cd "${_srcdir}"
  ./configure --prefix=/usr --disable-static --with-threads \
    --disable-debug-api --disable-debug --libexecdir=/usr/lib/gamin \
    --with-python=/usr/bin/python2
  make
}

package() {
  cd "${_srcdir}"
  make DESTDIR="$pkgdir" install
}
