# Maintainer: Incognitux <incognitux at proton mail dot com>

pkgname=nvibrant-bin
pkgver=1.0.5
pkgrel=2
pkgdesc="Nvidia Digital Vibrance on Wayland (binary release)"
arch=(x86_64)
url="https://github.com/Tremeschin/nVibrant"
license=('GPL-3.0')
provides=("nvibrant")
conflicts=("nvibrant")
depends=("python>=3.9" "python-packaging")
makedepends=("python-installer")
_name=${pkgname%-bin}

source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('244433e1e5c57a8b8a7f0c1390a60e4e57bd62ce6dc88f76d95a50d655f818e5')

package(){
  python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl

  # --- Patch the installed script ---
  _site_packages_path=$(python -c 'import site; print(site.getsitepackages()[0])')
  _target_py_file="${pkgdir}/${_site_packages_path}/${_name}/__main__.py"

  if [ -f "${_target_py_file}" ]; then
      msg "Patching ${_target_py_file} to comment out runtime chmod call..."
      sed -i '/shell("chmod", "+x", nvibrant, echo=False)/s/^/#/' "${_target_py_file}"
  else
      warning "Could not find ${_target_py_file} to patch. Skipping patch."
  fi
}
