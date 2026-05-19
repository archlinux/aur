# Maintainer: Akhmad Fauzan <email_anda@domain.com>
pkgname=antigravity-ide
pkgver=2.0.1
pkgrel=1
pkgdesc="Antigravity Development IDE"
arch=('x86_64')
url="https://website-resmi-antigravity.com"
license=('custom')
depends=('nss' 'alsa-lib' 'gtk3' 'libxss') # Dependensi standar Electron
provides=('antigravity-ide')
conflicts=('antigravity-ide')

# GANTI URL DI BAWAH dengan link download asli file tar.gz nya
source=("${pkgname}-${pkgver}.tar.gz::https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/2.0.1-4861014005645312/linux-x64/Antigravity%20IDE.tar.gz"
        "antigravity.desktop")

# Jalankan perintah `updpkgsums` di terminal untuk mengisi sha256sums secara otomatis
sha256sums=('747163aa3a8afba4b316f97c40b4a75ca4736a59768a416cd1e881e73ec31ef9'
            '61478433011e6a73f6f3fc8288d972f3fa3f86d6de104256bba9ac4be29b70ca')

package() {
    install -d "${pkgdir}/opt/${pkgname}"

    # 1. Salin seluruh isi folder aplikasi ke /opt/
    cp -r "${srcdir}/Antigravity IDE/"* "${pkgdir}/opt/${pkgname}/"

    # 2. Buat eksekutor (Wrapper Script) agar bisa dipanggil lewat terminal
    # Ini menggantikan symlink langsung, untuk menangani pembuatan symlink folder ~ milik user
    install -d "${pkgdir}/usr/bin"

    cat << 'EOF' > "${pkgdir}/usr/bin/antigravity-ide"
#!/bin/bash

# Buat direktori sumber jika belum ada agar symlink tidak error
mkdir -p "$HOME/.config/Antigravity"
mkdir -p "$HOME/.antigravity"

# Buat symlink folder konfigurasi jika belum ada
if [ ! -e "$HOME/.config/Antigravity IDE" ]; then
    ln -s "$HOME/.config/Antigravity" "$HOME/.config/Antigravity IDE"
fi

if [ ! -e "$HOME/.antigravity-ide" ]; then
    ln -s "$HOME/.antigravity" "$HOME/.antigravity-ide"
fi

# Jalankan aplikasi utama
exec "/opt/antigravity-ide/antigravity" "$@"
EOF

    # Beri izin eksekusi pada wrapper script
    chmod +x "${pkgdir}/usr/bin/antigravity-ide"

    # 3. Install file .desktop ke menu aplikasi sistem
    install -Dm644 "${srcdir}/antigravity.desktop" "${pkgdir}/usr/share/applications/antigravity-ide.desktop"

    # 4. === INI YANG BARU ===
    # Ambil code.png dari dalam folder ekstrak, dan taruh di folder ikon sistem dengan nama antigravity-ide.png
    install -Dm644 "${srcdir}/Antigravity IDE/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/pixmaps/antigravity-ide.png"
}
