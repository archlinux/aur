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
		"nvml-fix-upgrade.hook")
sha256sums=('SKIP'
'51c2e28e88193a8b2435ff23eb4d1818f8cdaaba32f7c2562862fae2223d3a35'
'93aba7a7d07593672cda2b65ae7d2de2230e6da7422b913b5e6c76adafe745b2')

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
	install -Dm644 "${srcdir}/nvml-fix-install.hook" "${pkgdir}/usr/share/libalpm/hooks/nvml-fix-install.hook"
	install -Dm644 "${srcdir}/nvml-fix-upgrade.hook" "${pkgdir}/usr/share/libalpm/hooks/nvml-fix-upgrade.hook"
}
