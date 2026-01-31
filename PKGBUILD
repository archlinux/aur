# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-iso-template-arch
pkgver=26.01.1
pkgrel=1
pkgdesc="Arch ISO template for MX snapshot and remaster workflows -- to be used only with MX Snapshot and arch-remaster tools"
arch=('any')
url="https://github.com/MX-Linux/arch-iso-template"
license=('GPL')
source=("https://github.com/MX-Linux/arch-iso-template/archive/refs/tags/26.01.1.tar.gz")
sha256sums=('2cc193dd58dad716a20ca063c259fe0ca770d9955fd8409022bcc836a1452ee0')

build() {
    cd "${srcdir}/arch-iso-template-${pkgver}"

    local template_dir="template"
    local work_dir="${srcdir}/work"

    # Copy template tree into a writable working directory
    cp -a "$template_dir/." "$work_dir/"

    # Copy GRUB assets from the arch template into the working tree
    chmod -R u+w "$work_dir/boot/grub/"
    cp -r "$template_dir/boot/grub/config" "$work_dir/boot/grub/"
    cp -r "$template_dir/boot/grub/fonts" "$work_dir/boot/grub/"
    cp -r "$template_dir/boot/grub/theme" "$work_dir/boot/grub/"
    cp "$template_dir/boot/grub/efi.img" "$work_dir/boot/grub/"
    cp "$template_dir/boot/grub/grubenv.cfg" "$work_dir/boot/grub/"
    cp "$template_dir/boot/grub/loopback.cfg" "$work_dir/boot/grub/"
    cp "$template_dir/boot/grub/unicode.pf2" "$work_dir/boot/grub/"

    # Create the source tarball
    tar --owner=0 --group=0 -czf "${srcdir}/iso-template.tar.gz" -C "$work_dir" .
}

package() {
    cd "${srcdir}/arch-iso-template-${pkgver}"

    install -Dm644 "${srcdir}/iso-template.tar.gz" \
        "${pkgdir}/usr/lib/iso-template/arch/iso-template.tar.gz"

    install -Dm644 "template/arch/README" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.arch-layout"
}
