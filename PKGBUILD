# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Raffaele Mancuso <raffaelemancuso532 at gmail dot com>
pkgname=pdf4qt
pkgver=1.7.0.0
_clipper2ver=2.0.1
pkgrel=1
pkgdesc="Open source PDF editor"
arch=('x86_64')
url="https://jakubmelka.github.io/"
_ghurl="https://github.com/JakubMelka/PDF4QT"
license=('LGPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    'openssl'
    'libjpeg-turbo'
    'qt6-speech'
    'qt6-svg'
    'qt6-base'
    'openjpeg2'
    'onetbb'
    'lcms2'
    'blend2d'
    'sane'
)
makedepends=(
    'git'
    'qt6-declarative'
    'qt6-multimedia'
    'qt6-tools'
    'cmake'
)
optdepends=(
    'flite: Text-To-Speech using flite synthesizer'
    'libspeechd: Text-To-Speech using speechd synthesizer'
)
options=('!strip')
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "clipper2-${_clipper2ver}.tar.gz::https://github.com/AngusJohnson/Clipper2/archive/refs/tags/Clipper2_${_clipper2ver}.tar.gz"
)
sha256sums=('01da732d172092a80a325f09cc3f64ed1298bccc76bcc2d7e108b3accccea931'
            '2a3693aceab4aed3e39b743e038d87701acc53cf05ed7b2013aab3e0aec5287e')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		[ -f "$d/CMakeLists.txt" ] && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 2 -mindepth 1 -type d ! -name '.*' -not -path '*Clipper2*' 2>/dev/null)
}
_set_c_build_env() {
	export HOME="${srcdir}/.home"
	mkdir -p "${HOME}"
	export CCACHE_DIR="${HOME}/.ccache"
}
prepare() {
    cd "$(_get_project_dir)"
    _set_c_build_env
    sed -i "s/OpenJPEG CONFIG REQUIRED/OpenJPEG REQUIRED/g" "$(_get_project_dir)/CMakeLists.txt"
    sed -i "s/PDF4QT_PLUGINS_DIR \${PDF4QT_INSTALL_LIB_DIR}\/${pkgname}/PDF4QT_PLUGINS_DIR \/\${PDF4QT_INSTALL_LIB_DIR}\/${pkgname}/g" \
        "$(_get_project_dir)/Pdf4QtEditorPlugins/CMakeLists.txt"
    sed -i "24i\message(PDF4QT_PLUGINS_DIR=\${PDF4QT_PLUGINS_DIR})" "$(_get_project_dir)/Pdf4QtEditorPlugins/CMakeLists.txt"
    sed -i 's|\./%1|/usr/bin/%1|g' "$(_get_project_dir)/Pdf4QtLaunchPad/launchapplication.cpp"
    # OpenSSL 4.x: several getters now return const pointers; adapt the callers.
    # pdfcertificatemanager.cpp
    sed -i 's|X509_NAME\* name = X509_get_subject_name(certificate.get());|X509_NAME* name = const_cast<X509_NAME*>(X509_get_subject_name(certificate.get()));|' \
        "$(_get_project_dir)/Pdf4QtLibCore/sources/pdfcertificatemanager.cpp"
    # pdfcertificatestore.cpp
    sed -i \
        -e 's|auto getStringFromASN1_STRING = \[\](ASN1_STRING\* string)|auto getStringFromASN1_STRING = [](const ASN1_STRING* string)|' \
        -e 's|X509_NAME_ENTRY\* entry = X509_NAME_get_entry(name, stringLocation);|const X509_NAME_ENTRY* entry = X509_NAME_get_entry(name, stringLocation);|' \
        -e 's|if (X509_NAME\* subjectName = X509_get_subject_name(certificate))|if (X509_NAME* subjectName = const_cast<X509_NAME*>(X509_get_subject_name(certificate)))|' \
        -e 's|X509_PUBKEY\* publicKey = X509_get_X509_PUBKEY(certificate);|const X509_PUBKEY* publicKey = X509_get_X509_PUBKEY(certificate);|' \
        "$(_get_project_dir)/Pdf4QtLibCore/sources/pdfcertificatestore.cpp"
    # pdfsignaturehandler.cpp + its header
    sed -i \
        -e 's|X509_NAME_ENTRY\* entry = X509_NAME_get_entry(name, stringLocation);|const X509_NAME_ENTRY* entry = X509_NAME_get_entry(name, stringLocation);|' \
        -e 's|ASN1_TYPE\* attribute = PKCS7_get_signed_attribute|const ASN1_TYPE* attribute = PKCS7_get_signed_attribute|' \
        -e 's|ASN1_TYPE\* attribute = PKCS7_get_attribute|const ASN1_TYPE* attribute = PKCS7_get_attribute|' \
        -e 's|getStringFromASN1_STRING(ASN1_STRING\* string)|getStringFromASN1_STRING(const ASN1_STRING* string)|' \
        -e 's|encryptedString->length|ASN1_STRING_length(encryptedString)|g' \
        -e 's|encryptedString->data|ASN1_STRING_get0_data(encryptedString)|g' \
        "$(_get_project_dir)/Pdf4QtLibCore/sources/pdfsignaturehandler.cpp"
    sed -i '1557s/ASN1_STRING_length(encryptedString)/ASN1_STRING_length(encryptedString.get())/g; 1557s/ASN1_STRING_get0_data(encryptedString)/ASN1_STRING_get0_data(encryptedString.get())/g' \
        "$(_get_project_dir)/Pdf4QtLibCore/sources/pdfsignaturehandler.cpp"
    sed -i 's|static QString getStringFromASN1_STRING(ASN1_STRING\* string);|static QString getStringFromASN1_STRING(const ASN1_STRING* string);|' \
        "$(_get_project_dir)/Pdf4QtLibCore/sources/pdfsignaturehandler_impl.h"
    # tst_timestamptest.cpp
    sed -i \
        -e 's|X509_NAME\* name = X509_get_subject_name(certificate);|X509_NAME* name = const_cast<X509_NAME*>(X509_get_subject_name(certificate));|' \
        -e 's|ASN1_TYPE\* value = attribute ? X509_ATTRIBUTE_get0_type(attribute, 0) : nullptr;|const ASN1_TYPE* value = attribute ? X509_ATTRIBUTE_get0_type(attribute, 0) : nullptr;|' \
        "$(_get_project_dir)/UnitTests/tst_timestamptest.cpp"
    # manifold 3.4.1-1 ships an EMPTY libClipper2.a: all four .o have .text
    # size 0 and the only symbol is __gnu_lto_slim, so it cannot satisfy
    # PDF4QT's Clipper2Lib:: references at link time. Build a real static
    # library from upstream source into a private prefix instead.
    cmake -S "${srcdir}/Clipper2-Clipper2_${_clipper2ver}/CPP" \
        -B "${srcdir}/clipper2-build" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX="${srcdir}/clipper2-prefix" \
        -DCLIPPER2_USINGZ=OFF \
        -DCLIPPER2_TESTS=OFF \
        -DCLIPPER2_EXAMPLES=OFF \
        -DCLIPPER2_UTILS=OFF \
        -Wno-dev
    cmake --build "${srcdir}/clipper2-build"
    cmake --install "${srcdir}/clipper2-build"
    cmake -B "$(_get_project_dir)/build" \
        -S "$(_get_project_dir)" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/' \
        -Wno-dev \
        -DCMAKE_MODULE_PATH="${srcdir}" \
        -DPDF4QT_INSTALL_DEPENDENCIES=0 \
        -DClipper2_DIR="${srcdir}/clipper2-prefix/lib/cmake/clipper2" \
        -DPDF4QT_LINUX=1
}
build() {
    cd "$(_get_project_dir)"
    _set_c_build_env
    cmake --build "$(_get_project_dir)/build"
}
package() {
    DESTDIR="${pkgdir}" cmake --install "$(_get_project_dir)/build"
}
