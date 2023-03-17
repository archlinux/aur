# Maintainer: dreieck
# Contributor: Alexander F. Rødseth

_pkgname=stable-diffusion-intel
pkgname="${_pkgname}-git"
pkgver=r44.20230213.f90e38a
pkgrel=1
pkgdesc='Image generator that uses stable diffusion, vino (Intel CPU) and includes "txt2img". Latest Git checkout.'
arch=(
  'any'
)
url='https://github.com/bes-dev/stable_diffusion.openvino'
license=(
  'Apache'
  'custom: CreativeML Open RAIL-M'
)
depends=(
  'bash'
  'openvino>=2022.3.0'
  'python>=3'
  'python<=3.9'
  'python-diffusers>=0.2.4'
  'python-ftfy>=6.1.1'
  'python-huggingface-hub>=0.9.0'
  'python-numpy>=1.19.5'
  'python-opencv>=4.5.5.64'
  # 'python-onnx'
  'python-piexif>=1.1.3'
  'python-pillow>=9.0.1'
  'python-pytorch'
  'python-scipy>=1.9.0'
  'python-streamlit-drawable-canvas>=0.9'
  'python-tqdm>=4.64.0'
  'python-transformers>=4.16.2'
  'python-watchdog>=2.1.9'
)
makedepends=(
  'git'
)
checkdepends=()
optdepends=()
provides=(
  "${_pkgname}"
  "txt2img=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)

source=(
  "${_pkgname}::git+${url}.git"
  'txt2img.sh'
)
sha256sums=(
  'SKIP'
  '351c30b3bc25a0a2b130e7b64d9d685b053e49fa639571c5e353266d4abd90d3'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Could not determine Git commit count."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

package() {
  cd "${srcdir}"

  ## TODO: Package it into proper directories, not /opt/.
  install -dvm755 "${pkgdir}/opt/${_pkgname}"

  cp -rv "${_pkgname}"/* "${pkgdir}/opt/${_pkgname}"
  chmod 755 "${pkgdir}/opt/${_pkgname}/demo.py"
  chmod 755 "${pkgdir}/opt/${_pkgname}/stable_diffusion_engine.py"
  ln -svr "${pkgdir}/opt/${_pkgname}/demo.py" "${pkgdir}/opt/${_pkgname}/txt2img"

  install -Dvm755 txt2img.sh "${pkgdir}/usr/bin/txt2img"

  install -dvm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  ln -sv "/opt/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  for _docfile in "${srcdir}/git.log"; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sv "/opt/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -sv "/opt/${_pkgname}/LICENSE_MODEL" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_MODEL"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_MODEL" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE_MODEL"
}
