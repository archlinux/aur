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
depends=('NVIDIA-MODULE' 'nvidia-utils')
source=("git+https://github.com/CFSworks/nvml_fix.git"
		"nvml_fix-install.hook")
sha256sums=('SKIP' '342955cc1a829b119fc0461cf3f12d2fd45e114cd38059938179738640d20c92')


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
	install -Dm755 "${srcdir}/${_pkgname}/libnvidia-ml.so.1" "${pkgdir}/usr/lib/libnvidia-ml.so.1.fix"
	install -Dm644 "${srcdir}/nvml_fix-install.hook" -t "${pkgdir}/usr/share/libalpm/hooks"
}
