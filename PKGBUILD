# Maintainer: Zeta <z@gonzaleza.cr>
pkgname=('agente-gaudi' 'middleware-idopte' 'certificados-bccr')
pkgver=Rev28
pkgrel=1
epoch=1
pkgdesc="Instalador de suite de firma digital costa rica"
arch=(x86_64)
url="https://soportefirmadigital.com/sfdj/dl.aspx"
license=('MIT' 'unknown' 'unknown')
depends=()
makedepends=("unzip")
options=("!strip")
source=("sfd_ClientesLinux_RPM64_Rev28.zip")
noextract=()
sha256sums=('f3c5fdd12686533ea60ddf3420e465b94228c7ed67474e031f86f60509f5e45d')

build() {
    bsdtar -xf "${srcdir}/Firma Digital/Idopte/scmiddleware-costa-rica-user_idopte_6.23.44.0_rh9_amd64.rpm" -C "${srcdir}/Firma Digital/Idopte"
    bsdtar -xf "${srcdir}/Firma Digital/Agente GAUDI/agente-gaudi_26.0_amd64.rpm" -C "${srcdir}/Firma Digital/Agente GAUDI"
}

package_certificados-bccr() {
    depends=("p11-kit" "pcsclite")
    install=certificados.install
    certs=(
        "CA POLITICA PERSONA FISICA - COSTA RICA v2.crt"
        "CA POLITICA PERSONA JURIDICA - COSTA RICA v2.crt" 
        "CA POLITICA SELLADO DE TIEMPO - COSTA RICA v2.crt"
        "CA RAIZ NACIONAL - COSTA RICA v2.crt"
        "CA SINPE - PERSONA FISICA v2(1).crt"
        "CA SINPE - PERSONA FISICA v2.cer"
        "CA SINPE - PERSONA JURIDICA v2(1).crt"
        "CA SINPE - PERSONA JURIDICA v2.cer"
        "Certificado Banco Central.cer"
        "GlobalSign CodeSigning CA - SHA256 - G3.cer"
        "GlobalSign Root CA - R3.cer"
    )
    msg "Installing certificates"
    for cert in "${certs[@]}"; do
        msg2 "Installing $cert"
        install -Dm644 "${srcdir}/Firma Digital/Certificados/${cert}" "${pkgdir}/etc/ca-certificates/trust-source/anchors/${cert}" 
    done
}

package_agente-gaudi() {
    provides=("Agente-GAUDI")
    install -d "${srcdir}/Firma Digital/Agente GAUDI/opt" "${pkgdir}/opt" 2> >(read err; error "$err")
    cp -r "${srcdir}/Firma Digital/Agente GAUDI/opt/"* "${pkgdir}/opt/" 2> >(read err; error "$err")
    install -d "${srcdir}/Firma Digital/Agente GAUDI/usr" "${pkgdir}/usr" 2> >(read err; error "$err")
    cp -r "${srcdir}/Firma Digital/Agente GAUDI/usr/"* "${pkgdir}/usr/" 2> >(read err; error "$err") 

    mkdir -p "${pkgdir}/usr/share/applications/"
    ln -s "${srcdir}/Firma Digital/Agente GAUDI/opt/Agente-GAUDI/lib/Agente-GAUDI.desktop" "${pkgdir}/usr/share/applications/Agente-GAUDI.desktop"
}

package_middleware-idopte() {
    depends=("aom" "at-spi2-core" "brotli" "bzip2" "cairo" "dav1d" "dbus" "e2fsprogs" "enchant" "expat" "fontconfig" "freetype2" "fribidi" "gdk-pixbuf2" "glib2" "glycin" "graphite" "gst-plugins-base-libs" "gstreamer" "gtk3" "harfbuzz" "harfbuzz-icu" "hidapi" "highway" "hyphen" "icu" "json-glib" "keyutils" "krb5" "lcms2" "libatomic" "libavif" "libcloudproviders" "libdatrie" "libdrm" "libelf" "libepoxy" "libevdev" "libffi" "libgcc" "libgcrypt" "libglvnd" "libgpg-error" "libgudev" "libidn2" "libjpeg-turbo" "libjxl" "libmanette" "libnotify" "libpng" "libpsl" "libseccomp" "libsecret" "libsoup" "libstdc++" "libtasn1" "libthai" "libunistring" "libunwind" "libwebp" "libx11" "libxau" "libxcb" "libxcomposite" "libxcursor" "libxdamage" "libxdmcp" "libxext" "libxfixes" "libxi" "libxinerama" "libxkbcommon" "libxml2" "libxrandr" "libxrender" "libxslt" "libyuv" "mesa" "openssl" "orc" "pango" "pcre2" "pcsclite" "pixman" "rav1e" "sqlite" "svt-av1" "systemd-libs" "tinysparql" "tpm2-tss" "util-linux-libs" "wayland" "webkit2gtk" "woff2" "xz" "zlib" "zstd")
    provides=("legacy.so" "libidolog.so" "libidop11.so" "libt_ias.so" "SCManager" "idocachesrv")
    conflicts=()

    msg "Installing smart card middleware"
    for item in "${provides[@]}"; do
        msg2 "Installing $item"
        install -Dm644 "${srcdir}/Firma Digital/Idopte/usr/lib/SCMiddleware/${item}" "${pkgdir}/usr/lib/SCMiddleware/${item}"
    done

    msg "Creating firma digital module"
    mkdir -p "${pkgdir}/usr/share/p11-kit/modules/"
    echo -n 'module: /usr/lib/SCMiddleware/libidop11.so' > "${pkgdir}/usr/share/p11-kit/modules/firma-digital.module"
}
