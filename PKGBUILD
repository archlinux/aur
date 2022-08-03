# Maintainer: KUMAX <kumax2047@pm.me>

_pkgname=nvml_fix
pkgname=nvml-fix-git
pkgrel=1
pkgver=r35.038fa0c
pkgdesc="A workaround for an annoying bug in nVidia's NVML library."
url=https://github.com/CFSworks/nvml_fix
arch=('x86_64' 'i686')
conflicts=(${pkgname%*git})
provides=(${pkgname%-git})
options=(!ccache)
depends=('nvidia-utils')
source=("git+https://github.com/CFSworks/nvml_fix.git"
		"nvml-fix-install.hook"
		"80-nvml-fix-upgrade.hook"
		"81-nvml-fix-reapply.hook"
		)
sha256sums=('SKIP'
'51c2e28e88193a8b2435ff23eb4d1818f8cdaaba32f7c2562862fae2223d3a35'
'5491bb06bf06d52b15457454f21a06041454545e6e814bea1af444d2122ab490'
'bb8fc6e57cf6d7ac1e1af0bf33099e885e0fbbd14c2a224cd8b832b9b8a3c86d'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	NVIDIA_VERSION=$(pacman -Qs nvidia-utils | head -n1 | awk '{print $2}' | sed  's/-[0-9]$//')
	cd ${srcdir}/${_pkgname}
	make TARGET_VER=$NVIDIA_VERSION libdir=/usr/lib
}
package() {
	install -Dm644 "${srcdir}/${_pkgname}/Makefile" "${pkgdir}/usr/src/nvml-fix-1/Makefile"
	install -Dm644 "${srcdir}/${_pkgname}/empty.c" "${pkgdir}/usr/src/nvml-fix-1/empty.c"
	install -Dm644 "${srcdir}/${_pkgname}/nvml_fix.c" "${pkgdir}/usr/src/nvml-fix-1/nvml_fix.c"
	install -Dm644 "${srcdir}/${_pkgname}/nvml_v9.h" "${pkgdir}/usr/src/nvml-fix-1/nvml_v9.h1"
	install -Dm644 "${srcdir}/${_pkgname}/nvml_v3.h" "${pkgdir}/usr/src/nvml-fix-1/nvml_v3.h1"
	install -Dm755 "${srcdir}/${_pkgname}/libnvidia-ml.so.1" "${pkgdir}/usr/lib/libnvidia-ml.so.1.fix"
	install -Dm644 "${srcdir}/nvml-fix-install.hook" "${pkgdir}/usr/share/libalpm/hooks/nvml-fix-upgrade.hook"
	install -Dm644 "${srcdir}/80-nvml-fix-upgrade.hook" "${pkgdir}/usr/share/libalpm/hooks/80-nvml-fix-upgrade.hook"
	install -Dm644 "${srcdir}/81-nvml-fix-reapply.hook" "${pkgdir}/usr/share/libalpm/hooks/81-nvml-fix-install.hook"
}
