# Maintainer: hotline1337 <denuvo at tuta dot io>

_pkgname="ntsync-iocp"
pkgname="${_pkgname}-dkms-git"
pkgver=r272.g58b5ef5
pkgrel=1
pkgdesc="Salkim ntsync kernel module with IOCP support (DKMS)"
arch=("any")
url="https://github.com/nanomatters/salkim-kernel-modules"
license=(
  "GPL-2.0-only"
  "GPL-2.0-only WITH Linux-syscall-note"
)
depends=("dkms")
makedepends=("git")
provides=(
  "${_pkgname}-dkms=${pkgver}"
  "${_pkgname}-git=${pkgver}"
  "NTSYNC-MODULE"
)
conflicts=(
  "${_pkgname}-dkms"
  "${_pkgname}-git"
  "salkim-kernel-modules-dkms"
)
source=("${_pkgname}::git+https://github.com/nanomatters/salkim-kernel-modules.git")
b2sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # Revert local changes if running makepkg repeatedly in the same srcdir
  git checkout -f -- ntsync.c

  # Compatibility patch for Linux 7.4+ (struct fd_prepare changes)
  patch -Np1 <<'EOF'
--- a/ntsync.c
+++ b/ntsync.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/anon_inodes.h>
+#include <linux/version.h>
 #include <linux/atomic.h>
 #include <linux/file.h>
 #include <linux/fs.h>
@@ -1114,9 +1115,15 @@ static int ntsync_obj_get_fd(struct ntsync_obj *obj)
 {
 	FD_PREPARE(fdf, O_CLOEXEC,
 		   anon_inode_getfile("ntsync", &ntsync_obj_fops, obj, O_RDWR));
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(7, 4, 0)
+	if (fdf->fd < 0)
+		return fdf->fd;
+	obj->file = fdf->file;
+#else
 	if (fdf.err)
 		return fdf.err;
 	obj->file = fd_prepare_file(fdf);
+#endif
 	return fd_publish(fdf);
 }
EOF
}

package() {
  local _dkms_source="${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  cd "${srcdir}/${_pkgname}"

  install -dm755 "${_dkms_source}"

  # DKMS module source
  install -Dm644 Makefile "${_dkms_source}/Makefile"
  install -Dm644 ntsync.c "${_dkms_source}/ntsync.c"
  install -Dm644 include/uapi/linux/ntsync.h "${_dkms_source}/include/uapi/linux/ntsync.h"

  # DKMS configuration
  cat > "${_dkms_source}/dkms.conf" <<DKMS_EOF
PACKAGE_NAME="${_pkgname}"
PACKAGE_VERSION="${pkgver}"
BUILT_MODULE_NAME[0]="ntsync"
BUILT_MODULE_LOCATION[0]="."
DEST_MODULE_LOCATION[0]="/updates/dkms"
MAKE[0]="'make' KDIR=/lib/modules/\${kernelver}/build module"
AUTOINSTALL="yes"
DKMS_EOF

  # Licenses
  install -Dm644 amdgpu/LICENSES/preferred/GPL-2.0 "${pkgdir}/usr/share/licenses/${pkgname}/GPL-2.0"
  install -Dm644 amdgpu/LICENSES/exceptions/Linux-syscall-note "${pkgdir}/usr/share/licenses/${pkgname}/Linux-syscall-note"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 Documentation/ntsync.rst "${pkgdir}/usr/share/doc/${pkgname}/ntsync.rst"
  install -Dm644 Documentation/iocp.rst "${pkgdir}/usr/share/doc/${pkgname}/iocp.rst"
}
