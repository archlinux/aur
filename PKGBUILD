# Maintainer: Incognitux <incognitux at proton mail dot com>

pkgname=nvibrant-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Nvidia Digital Vibrance on Wayland (binary release)"
arch=(x86_64)
url="https://github.com/Tremeschin/nVibrant"
license=('GPL-3.0')
provides=("nvibrant")
conflicts=("nvibrant")
depends=("python>=3.9" "python-packaging")
makedepends=("python-installer")
_pkgname=${pkgname%-bin}

# source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
source=("https://github.com/Tremeschin/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-py3-none-manylinux_2_17_x86_64.whl")
sha256sums=('e15cbc54738cfb37490814cd7d1f7dbfc209cbc4e759c39d76b858c0d80809fd')

package(){
  python -m installer --destdir="$pkgdir" *.whl

  # --- Patch the installed script ---
  _site_packages_path=$(python -c 'import site; print(site.getsitepackages()[0])')
  _target_py_file="${pkgdir}${_site_packages_path}/${_pkgname}/__main__.py"

  if [ -f "${_target_py_file}" ]; then
      msg "Patching ${_target_py_file} to comment out runtime chmod call..."
      sed -i '/shell("chmod", "+x", nvibrant, echo=False)/s/^/#/' "${_target_py_file}"
  else
      warning "Could not find ${_target_py_file} to patch. Skipping patch."
  fi
}
