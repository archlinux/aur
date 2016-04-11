#Contributor: MatToufoutu <mattoufootu[at]gmail[dot]com>
#Contributor: Jan Lieven jan[at]das<minus>labor(dot)org

pkgname=john-mpi
pkgver=1.8.0
pkgrel=3
_patchlevel=jumbo-1
arch=('i686' 'x86_64')
pkgdesc='JohnTheRipper password cracker with Jumbo patch and MPI support'
url='http://openwall.info'
license=('GPL')
provides=('john')
conflicts=('john' 'john-latest')
# For OpenCL support change swap the {make}depends arrays
depends=('mpich')
makedepends=('mpich')
# Remember to include one of the following packages into the depends
# array for OpenCL to work:
# opencl-mesa
# amdapp-sdk
# opencl-nvidia
# intel-opencl-sdk
#depends=('mpich' 'opencl-nvidia')
#makedepends=('opencl-headers')
backup=(etc/john/john.conf
        etc/john/dumb32.conf
        etc/john/dumb16.conf
        etc/john/dynamic.conf)

source=("http://www.openwall.com/john/j/john-${pkgver}-${_patchlevel}.tar.xz"
        "https://github.com/magnumripper/JohnTheRipper/commit/e2e868db3e153b3f959e119a51703d4afb99c624.patch"
        "params.h.patch")

prepare() {
  cd ${srcdir}/john-${pkgver}-${_patchlevel}/src
  patch -p0 < ${srcdir}/params.h.patch
	patch -p2 < ${srcdir}/e2e868db3e153b3f959e119a51703d4afb99c624.patch
}

build() {
  export PATH=/opt/mpich/bin:${PATH}
	export CFLAGS="${CFLAGS} -DJOHN_SYSTEMWIDE=1"

  cd ${srcdir}/john-${pkgver}-${_patchlevel}/src
	./configure --prefix=/usr --enable-mpi

	if [ $(which icc) -eq 0 ]; then
		case "${CARCH}" in
			"x86_64")
				make sse-intrinsics-64.S
				break
				;;
			"i686")
				make sse-intrinsics-32.S
				break
				;;
		esac
	fi

	make
}

package() {
	# config file
	sed -i 's|$JOHN|/usr/share/john|g' ${srcdir}/john-${pkgver}-${_patchlevel}/run/john.conf
  sed -i 's|/usr/share/john/dumb|/etc/john/dumb|g' ${srcdir}/john-${pkgver}-${_patchlevel}/run/john.conf
  sed -i 's|/usr/share/john/korelogic.conf|/etc/john/korelogic.conf|g' ${srcdir}/john-${pkgver}-${_patchlevel}/run/john.conf
  sed -i 's|/usr/share/john/repeats16.conf|/etc/john/repeats16.conf|g' ${srcdir}/john-${pkgver}-${_patchlevel}/run/john.conf
  sed -i 's|/usr/share/john/repeats32.conf|/etc/john/repeats32.conf|g' ${srcdir}/john-${pkgver}-${_patchlevel}/run/john.conf
  sed -i 's|.include <regex_alphabets.conf>|.include /etc/john/regex_alphabets.conf|g' ${srcdir}/john-${pkgver}-${_patchlevel}/run/john.conf
  sed -i 's|.include <dynamic.conf>|.include /etc/john/dynamic.conf|g' ${srcdir}/john-${pkgver}-${_patchlevel}/run/john.conf
  sed -i 's|.include "/usr/share/john/john.local.conf"|#.include "/usr/share/john/john.local.conf"|g' ${srcdir}/john-${pkgver}-${_patchlevel}/run/john.conf
  install -dm755 ${pkgdir}/etc/john
	install -m644 ${srcdir}/john-${pkgver}-${_patchlevel}/run/*.conf ${pkgdir}/etc/john/
	
	# docs
	install -d -m755 ${pkgdir}/usr/share/doc/john
	install -m644 ${srcdir}/john-${pkgver}-${_patchlevel}/doc/* ${pkgdir}/usr/share/doc/john/
	install -d -m755 ${pkgdir}/usr/share/john/
	install -m644 ${srcdir}/john-${pkgver}-${_patchlevel}/run/*.chr ${pkgdir}/usr/share/john/
	install -m644 ${srcdir}/john-${pkgver}-${_patchlevel}/run/password.lst ${pkgdir}/usr/share/john/
	install -Dm644 ${srcdir}/john-${pkgver}-${_patchlevel}/doc/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE

	# install binaries
  cd ${srcdir}/john-${pkgver}-${_patchlevel}/run/
  for i in $(find . -type f -perm 755); do
    install -Dm755 ${i} ${pkgdir}/usr/bin/${i}
  done
	cd ${pkgdir}/usr/bin
	ln -s john unafs
	ln -s john unique
	ln -s john unshadow
	ln -s john undrop
}
sha256sums=('bac93d025995a051f055adbd7ce2f1975676cac6c74a6c7a3ee4cfdd9c160923'
            'c84d53f4e2b5c15c9ab83aea05d72a7e1492e4f0cb547e0047aa91458851aee5'
            '432466152dda1bfaae66095ac6d1db48e91c2557e412c799b8c01921b749414a')
