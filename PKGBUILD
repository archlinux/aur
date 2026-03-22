# Maintainer: tu-usuario <tu@email.com>
#
# rubrika-certificates — Certificados raíz del DNIe y la FNMT
#
# Fuentes de huellas oficiales:
#   FNMT : https://www.sede.fnmt.gob.es/descargas/certificados-raiz-de-la-fnmt
#   DNIe : https://www.dnielectronico.es/PortalDNIe/PRF1_Cons02.action?pag=REF_077
#
# Estrategia de verificación:
#   - sha256sums = SKIP (los ZIPs cambian sin aviso, los hashes del contenedor
#     no tienen valor — verificamos el certificado, no el envoltorio)
#   - En prepare() calculamos la huella SHA-1 de cada certificado X.509
#     y la comparamos con la publicada en las webs oficiales.
#   - Los certificados raíz tienen huella estable de por vida.
#   - Los intermedios (AC subordinadas del DNIe) solo se valida que sean
#     X.509 válidos, ya que caducan y se renuevan periódicamente.

pkgname=rubrika-certificates
pkgver=1.0.0
pkgrel=1
pkgdesc="Certificados raíz del DNIe (DGP) y la FNMT para uso en Linux"
arch=('any')
url='https://github.com/tu-usuario/rubrika'
license=('custom:public-domain')
depends=('ca-certificates-utils')
install=rubrika-certificates.install

# ── FNMT: descarga directa de .cer ────────────────────────────────────────────
# ── DNIe: ZIPs desde dnielectronico.es (requiere User-Agent de navegador) ────

source=(
    # FNMT — Raíz principal
    "AC_Raiz_FNMT-RCM_SHA256.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Raiz_FNMT-RCM_SHA256.cer"

    # FNMT — AC subordinadas (certificados de usuarios, representación, sector público...)
    "AC_FNMT_Usuarios.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_FNMT_Usuarios.cer"
    "AC_Representacion.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Representacion.cer"
    "AC_Sector_Publico.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Sector_Publico.cer"

    # FNMT — G2 (segunda generación)
    "AC_Raiz_FNMT-RCM_G2.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Raiz_FNMT-RCM_G2.cer"
    "AC_Usuarios_G2.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Usuarios_G2.cer"
    "AC_Representacion_G2.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Representacion_G2.cer"
    "AC_Sector_Publico_G2.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Sector_Publico_G2.cer"

    # DNIe — Raíces (en ZIP, el servidor exige User-Agent de navegador)
    "ACRAIZ-DNIE2.zip::https://www.dnielectronico.es/ZIP/ACRAIZ-DNIE2.zip"
    "ACRAIZ-SHA2.zip::https://www.dnielectronico.es/ZIP/ACRAIZ-SHA2.zip"

    # DNIe — AC subordinadas (intermedias, se renuevan periódicamente)
    "ACDNIE004.zip::https://www.dnielectronico.es/ZIP/ACDNIE004.crt.zip"
    "ACDNIE005.zip::https://www.dnielectronico.es/ZIP/ACDNIE005.crt.zip"
    "ACDNIE006.zip::https://www.dnielectronico.es/ZIP/ACDNIE006.crt.zip"
)

# SKIP en todos: verificamos el contenido (certificado X.509), no el contenedor
sha256sums=(
    'SKIP'  # AC_Raiz_FNMT-RCM_SHA256.cer
    'SKIP'  # AC_FNMT_Usuarios.cer
    'SKIP'  # AC_Representacion.cer
    'SKIP'  # AC_Sector_Publico.cer
    'SKIP'  # AC_Raiz_FNMT-RCM_G2.cer
    'SKIP'  # AC_Usuarios_G2.cer
    'SKIP'  # AC_Representacion_G2.cer
    'SKIP'  # AC_Sector_Publico_G2.cer
    'SKIP'  # ACRAIZ-DNIE2.zip
    'SKIP'  # ACRAIZ-SHA2.zip
    'SKIP'  # ACDNIE004.zip
    'SKIP'  # ACDNIE005.zip
    'SKIP'  # ACDNIE006.zip
)

# User-Agent de navegador para los servidores del DNIe y la FNMT
# (sin esto curl falla por SSL bootstrap o por rechazo del servidor)
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla/5.0' -fLC - --retry 3 --retry-delay 3 -o %o %u")

# ── Huellas SHA-1 oficiales ───────────────────────────────────────────────────
# Fuente FNMT: https://www.sede.fnmt.gob.es/descargas/certificados-raiz-de-la-fnmt
# Fuente DNIe: https://www.dnielectronico.es/PortalDNIe/PRF1_Cons02.action?pag=REF_077
#
# NOTA: Los certificados raíz tienen huella estable de por vida.
# Solo cambiarían si la FNMT/DGP emite una nueva raíz, algo que anuncian
# públicamente con meses de antelación. Si este PKGBUILD falla en prepare()
# por una huella, comprueba primero las webs oficiales antes de actualizar.

_SHA1_FNMT_RAIZ="ec503507b215c4956219e2a89a5b42992c4c2c20"
_SHA1_FNMT_USUARIOS="808b72e43b574cf5877cb841a8df88396d38ab94"
_SHA1_FNMT_REPRESENTACION="eeebd3f6990b036d79d504ea7e4ec7c1ee2a8c13"
_SHA1_FNMT_SECTOR_PUBLICO="95f606d5f8b67ce39d91fe3dc84141b3f97bfff9"
_SHA1_FNMT_RAIZ_G2="a4d6b770e765a9bf17ecd7b5e03b852d612fa71d"
_SHA1_FNMT_USUARIOS_G2="e9f499a0efeff7a60e9fe6b52fa3a8febbbdba0a"
_SHA1_FNMT_REPRESENTACION_G2="ea14f87a91b6a62c6d5f40b5642520380ec1c12a"
_SHA1_FNMT_SECTOR_PUBLICO_G2="9a3a232deda8a81586379c26a7ba7e163194c1b0"

# DNIe — raíces (huellas publicadas en dnielectronico.es)
_SHA1_DNIE_RAIZ="b38fecec0b148aa686c3d00f01ecc8848e8085eb"      # AC RAIZ DNIE (SHA-1)
_SHA1_DNIE_RAIZ_SHA256="2229f056d34d1cb63e986f26b2d08ab94ff08e4d" # AC RAIZ DNIE (SHA-256)
_SHA1_DNIE_RAIZ2="eb4d6902fd60ecd50ee58e2c9f20292c391027ce"      # AC RAIZ DNIE 2

# ── Función auxiliar de verificación ─────────────────────────────────────────
# Calcula la huella SHA-1 del certificado (acepta DER y PEM)
# y la compara con el valor esperado.
_verificar_huella() {
    local archivo="$1"
    local esperado="$2"
    local nombre="$3"

    # Intentar DER primero, luego PEM
    local real
    real=$(openssl x509 -inform DER -in "$archivo" -noout -fingerprint -sha1 2>/dev/null \
        || openssl x509 -inform PEM -in "$archivo" -noout -fingerprint -sha1 2>/dev/null)

    if [[ -z "$real" ]]; then
        error "No se puede leer '$archivo' como certificado X.509"
        return 1
    fi

    # Normalizar: quitar "SHA1 Fingerprint=", espacios y dos puntos, pasar a minúsculas
    real=$(echo "$real" | sed 's/.*=//;s/://g;s/ //g' | tr 'A-F' 'a-f')
    esperado=$(echo "$esperado" | tr 'A-F' 'a-f' | tr -d ':')

    if [[ "$real" != "$esperado" ]]; then
        error "Huella incorrecta en $nombre"
        error "  Esperada : $esperado"
        error "  Obtenida : $real"
        error "  Comprueba https://www.sede.fnmt.gob.es/descargas/certificados-raiz-de-la-fnmt"
        error "  o        https://www.dnielectronico.es/PortalDNIe/PRF1_Cons02.action?pag=REF_077"
        return 1
    fi

    msg2 "OK  $nombre"
}

# ── Función auxiliar: solo validar estructura X.509 ──────────────────────────
_verificar_x509() {
    local archivo="$1"
    local nombre="$2"
    openssl x509 -inform DER -in "$archivo" -noout 2>/dev/null \
        || openssl x509 -inform PEM -in "$archivo" -noout 2>/dev/null \
        || { error "No es un certificado X.509 válido: $nombre"; return 1; }
    msg2 "OK  $nombre (X.509 válido)"
}

prepare() {
    # makepkg ya extrajo los ZIPs con bsdtar antes de llamar a prepare()
    # Los archivos están en $srcdir — entramos para que las rutas sean relativas
    cd "$srcdir"

    msg "Verificando huellas SHA-1 de certificados raíz (fuentes oficiales)..."

    # Helper: busca un archivo por nombre (cualquier subcarpeta) y devuelve su ruta
    _buscar() {
        find "$srcdir" \( -type f -o -type l \) -iname "$1" | head -1
    }

    # ── FNMT: certificados raíz — huella fija ──
    _verificar_huella "$(_buscar 'AC_Raiz_FNMT-RCM_SHA256.cer')" "$_SHA1_FNMT_RAIZ"             "AC Raiz FNMT-RCM"
    _verificar_huella "$(_buscar 'AC_FNMT_Usuarios.cer')"         "$_SHA1_FNMT_USUARIOS"          "AC FNMT Usuarios"
    _verificar_huella "$(_buscar 'AC_Representacion.cer')"        "$_SHA1_FNMT_REPRESENTACION"    "AC Representacion"
    _verificar_huella "$(_buscar 'AC_Sector_Publico.cer')"        "$_SHA1_FNMT_SECTOR_PUBLICO"    "AC Sector Publico"
    _verificar_huella "$(_buscar 'AC_Raiz_FNMT-RCM_G2.cer')"     "$_SHA1_FNMT_RAIZ_G2"           "AC Raiz FNMT-RCM G2"
    _verificar_huella "$(_buscar 'AC_Usuarios_G2.cer')"           "$_SHA1_FNMT_USUARIOS_G2"       "AC Usuarios G2"
    _verificar_huella "$(_buscar 'AC_Representacion_G2.cer')"     "$_SHA1_FNMT_REPRESENTACION_G2" "AC Representacion G2"
    _verificar_huella "$(_buscar 'AC_Sector_Publico_G2.cer')"     "$_SHA1_FNMT_SECTOR_PUBLICO_G2" "AC Sector Publico G2"

    # ── DNIe: certificados raíz — huella fija ──
    # ACRAIZ-SHA2 puede llamarse ACRAIZ-SHA2.cer o similar segun el ZIP
    local _dnie_raiz
    _dnie_raiz=$(find "$srcdir" \( -type f -o -type l \) -name 'ACRAIZ-SHA2.cer' | head -1)
    if [[ -z "$_dnie_raiz" ]]; then
        error "No se encontro el certificado raiz del DNIe (ACRAIZ-SHA2.cer)"
        return 1
    fi
    _verificar_huella "$_dnie_raiz" "$_SHA1_DNIE_RAIZ_SHA256" "AC RAIZ DNIE (algoritmo SHA-256)"

    # AC RAIZ DNIE 2
    local _dnie_raiz2
    _dnie_raiz2=$(find "$srcdir" \( -type f -o -type l \) -name 'AC RAIZ DNIE 2.crt' | head -1)
    if [[ -n "$_dnie_raiz2" ]]; then
        _verificar_huella "$_dnie_raiz2" "$_SHA1_DNIE_RAIZ2" "AC RAIZ DNIE 2"
    fi

    msg "Verificando estructura X.509 de AC subordinadas del DNIe..."
    while IFS= read -r -d '' cert; do
        _verificar_x509 "$cert" "$(basename "$cert")"
    done < <(find "$srcdir" \( -type f -o -type l \) -iname 'AC*DNIE*0*.crt' -print0)
}

package() {
    local destino="$pkgdir/usr/share/ca-certificates/trust-source/anchors"
    install -dm755 "$destino"

    _buscar() { find "$srcdir" \( -type f -o -type l \) -iname "$1" | head -1; }
    _instalar() {
        local src="$1" dst="$2"
        if [[ -n "$src" && -f "$src" ]]; then
            install -Dm644 "$src" "$destino/$dst"
            msg2 "Instalado: $dst"
        else
            warning "No encontrado: $dst (se omite)"
        fi
    }

    msg "Instalando certificados FNMT..."
    _instalar "$(_buscar 'AC_Raiz_FNMT-RCM_SHA256.cer')" "FNMT_AC_Raiz.cer"
    _instalar "$(_buscar 'AC_FNMT_Usuarios.cer')"          "FNMT_AC_Usuarios.cer"
    _instalar "$(_buscar 'AC_Representacion.cer')"         "FNMT_AC_Representacion.cer"
    _instalar "$(_buscar 'AC_Sector_Publico.cer')"         "FNMT_AC_Sector_Publico.cer"
    _instalar "$(_buscar 'AC_Raiz_FNMT-RCM_G2.cer')"      "FNMT_AC_Raiz_G2.cer"
    _instalar "$(_buscar 'AC_Usuarios_G2.cer')"            "FNMT_AC_Usuarios_G2.cer"
    _instalar "$(_buscar 'AC_Representacion_G2.cer')"      "FNMT_AC_Representacion_G2.cer"
    _instalar "$(_buscar 'AC_Sector_Publico_G2.cer')"      "FNMT_AC_Sector_Publico_G2.cer"

    msg "Instalando certificados DNIe..."
    # Raiz DNIe — buscar por nombre aproximado
    local _r
    _r=$(find "$srcdir" \( -type f -o -type l \) -name 'ACRAIZ-SHA2.cer' | head -1)
    _instalar "$_r" "DNIe_AC_Raiz.cer"
    _r=$(find "$srcdir" \( -type f -o -type l \) \( -iname '*DNIE*2.crt' -o -iname 'AC*RAIZ*DNIE*2*' \) | head -1)
    _instalar "$_r" "DNIe_AC_Raiz_2.crt"
    # Subordinadas DNIe
    local i=4
    while IFS= read -r -d '' cert; do
        _instalar "$cert" "DNIe_AC_00${i}.crt"
        (( i++ ))
    done < <(find "$srcdir" \( -type f -o -type l \) -iname 'AC*DNIE*0*.crt' -print0 | sort -z)
}
