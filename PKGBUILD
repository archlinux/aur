# Maintainer: Raul Dias <raul@dias.com.br>
#
# Four ONNX person-segmentation models, one package per model, from one split
# PKGBUILD:
#
#   omarchy-onnx-model-mediapipe-landscape
#   omarchy-onnx-model-pphumanseg-v2-mobile
#   omarchy-onnx-model-pphumanseg-v2-lite
#   omarchy-onnx-model-modnet
#
# Each package installs its model file into the shared directory
#   /usr/share/omarchy-onnx-models/
# which belongs to no one program: any program may read it (omarchy-broadcast's
# ONNX cut-out module does), and the packages can be installed in any
# combination. Each package also installs the Apache-2.0 text and the NOTICE
# of its model (the attribution and, for a converted file, the modification
# notice of section 4(b)) into /usr/share/licenses/<package>/.
#
# Nothing is compiled here. The sources are the model files of the published
# release v$pkgver of https://github.com/rsd/omarchy-onnx-models (converted
# there from the upstream weights by a pinned recipe; the release lists their
# SHA-256 in its SHA256SUMS) and the licence and notice files of the same tag.
# Each is saved under a name that carries pkgver, so a shared SRCDEST never
# serves a stale file after a bump. The packages are architecture independent.
#
# pkgver is the release tag without its "v": 1.0.0 comes from the tag v1.0.0.
# A new release changes pkgver, the checksums of the model files (_sha256) and
# the checksums of the licence and notice files (_license_sha256 and
# _notice_sha256). The model data below is kept in step with models.toml of the
# upstream repository, which tests it (scripts/tests/pkgbuild-test.sh).

pkgbase=omarchy-onnx-models
pkgdesc='ONNX person-segmentation models (MediaPipe, PP-HumanSeg, MODNet), one package per model'
pkgname=(
    omarchy-onnx-model-mediapipe-landscape
    omarchy-onnx-model-pphumanseg-v2-mobile
    omarchy-onnx-model-pphumanseg-v2-lite
    omarchy-onnx-model-modnet
)
pkgver=1.0.0
pkgrel=1
arch=('any')
# Data files only: no ELF to strip and no debug package.
options=('!strip' '!debug')
url='https://github.com/rsd/omarchy-onnx-models'

# Per model, in the order of models.toml: its id, its release file, the
# SHA-256 of the file, and the SHA-256 of licenses/<id>/LICENSE and
# licenses/<id>/NOTICE at the release tag.
_ids=(
    mediapipe-landscape
    pphumanseg-v2-mobile
    pphumanseg-v2-lite
    modnet
)
_files=(
    selfie_segmentation_landscape.onnx
    pp_humansegv2_mobile_192x192.onnx
    pp_humansegv2_lite_192x192.onnx
    modnet_photographic.onnx
)
_sha256=(
    fa02222275c455638fa1190493b659d25ad31e86f1b6459f17bd501f02cbe43d
    2bca11ec1f2a662146147d97523d613f5ef4ebf2a89803a95a0cbabfe2bd70a9
    ca96b4436f1ce6a76059e8902e20a9617f6829fb11f6c6c9e876563e6352e6b4
    07c308cf0fc7e6e8b2065a12ed7fc07e1de8febb7dc7839d7b7f15dd66584df9
)
_license_sha256=(
    62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a
    62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a
    62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a
    62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a
)
_notice_sha256=(
    5d8b13c7a4fbdaa33a29a853d174f2bdd4e7e9a393773c2885b61d31e97fe991
    81a00729b9979a30202bdf9b5d660f7894748ba05855642a9151f156859dd88c
    34811509d661942b69999895d2cbf32203d3812d5058475e37161a07b3e15550
    68c8768794a9da6dc1fae00fac63e59c231d6718845000c77e61d9116f4cf1b4
)

_release="$url/releases/download/v$pkgver"
_tree="https://raw.githubusercontent.com/rsd/omarchy-onnx-models/v$pkgver/licenses"
source=()
sha256sums=()
for _i in "${!_ids[@]}"; do
    source+=(
        "${_ids[_i]}-$pkgver-${_files[_i]}::$_release/${_files[_i]}"
        "${_ids[_i]}-$pkgver-LICENSE::$_tree/${_ids[_i]}/LICENSE"
        "${_ids[_i]}-$pkgver-NOTICE::$_tree/${_ids[_i]}/NOTICE"
    )
    sha256sums+=(
        "${_sha256[_i]}"
        "${_license_sha256[_i]}"
        "${_notice_sha256[_i]}"
    )
done
unset _i

# _install_model <id>: the model file, its licence and its notice.
_install_model() {
    local i found=
    for i in "${!_ids[@]}"; do
        if [[ ${_ids[i]} == "$1" ]]; then
            found=1
            break
        fi
    done
    if [[ -z $found ]]; then
        echo "_install_model: unknown model id '$1'" >&2
        return 1
    fi
    install -Dm644 "$srcdir/$1-$pkgver-${_files[i]}" "$pkgdir/usr/share/omarchy-onnx-models/${_files[i]}"
    install -Dm644 "$srcdir/$1-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$1-$pkgver-NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}

package_omarchy-onnx-model-mediapipe-landscape() {
    pkgdesc='MediaPipe Selfie Segmentation (landscape) person-segmentation model, as an ONNX file'
    license=('Apache-2.0')
    _install_model mediapipe-landscape
}

package_omarchy-onnx-model-pphumanseg-v2-mobile() {
    pkgdesc='PP-HumanSeg v2 mobile (192x192) person-segmentation model, as an ONNX file'
    license=('Apache-2.0')
    _install_model pphumanseg-v2-mobile
}

package_omarchy-onnx-model-pphumanseg-v2-lite() {
    pkgdesc='PP-HumanSeg v2 lite (192x192) person-segmentation model, as an ONNX file'
    license=('Apache-2.0')
    _install_model pphumanseg-v2-lite
}

package_omarchy-onnx-model-modnet() {
    pkgdesc='MODNet (photographic) portrait-matting model, as an ONNX file'
    license=('Apache-2.0')
    _install_model modnet
}
