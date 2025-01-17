# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="gurobipy"
_py=cp312
pkgname="python-${_name}"
pkgver=12.0.0
pkgrel=2
pkgdesc="Python interface to Gurobi"
arch=('x86_64' 'aarch64')
url="https://www.gurobi.com/products/gurobi-optimizer"
license=('custom:Gurobi EULA')
depends=('glibc' 'gurobi' 'python>=3.12' 'python-numpy' 'python-scipy')
makedepends=('python-installer' 'python-wheel')
source_x86_64=("https://files.pythonhosted.org/packages/${_py}/${_name::1}/${_name}/${_name//-/_}-${pkgver}-${_py}-${_py}-manylinux2014_x86_64.manylinux_2_17_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/${_py}/${_name::1}/${_name}/${_name//-/_}-${pkgver}-${_py}-${_py}-manylinux2014_aarch64.manylinux_2_17_aarch64.whl")
noextract=("${source_x86_64[@]##*/}"
           "${source_aarch64[@]##*/}")
sha256sums_x86_64=('90bba495efb25cff5a3826158aff7be29637d2e80accc3a89a98cb8630856106')
sha256sums_aarch64=('f8287de7535c3b9c97f4aa8716969d70302a972bd09e9d3b6fbd7266ca0eab72')

# https://everydaywithlinux.blogspot.com/2012/11/patch-strings-in-binary-files-with-sed.html
_patch_strings_in_file() {
  local FILE="$1"
  local PATTERN="$2"
  local REPLACEMENT="$3"
  
  STRINGS=$(strings ${FILE} | grep ${PATTERN} | sort -u -r)
  if [ "${STRINGS}" != "" ] ; then
    echo "Patching file '${FILE}'"
    for OLD_STRING in ${STRINGS} ; do
      NEW_STRING=${OLD_STRING//${PATTERN}/${REPLACEMENT}}
      OLD_STRING_HEX="$(echo -n "${OLD_STRING}" | xxd -g 0 -u -ps -c 256 | tr -d '\n')"
      NEW_STRING_HEX="$(echo -n "${NEW_STRING}" | xxd -g 0 -u -ps -c 256 | tr -d '\n')"
      if [ ${#NEW_STRING_HEX} -le ${#OLD_STRING_HEX} ] ; then
        while [ ${#NEW_STRING_HEX} -lt ${#OLD_STRING_HEX} ] ; do
          NEW_STRING_HEX="${NEW_STRING_HEX}00"
        done
        echo -n "Replacing ${OLD_STRING} with ${NEW_STRING}... "
        hexdump -ve '1/1 "%.2X"' ${FILE} | \
          sed "s/${OLD_STRING_HEX}/${NEW_STRING_HEX}/g" | \
          xxd -r -p > ${FILE}.tmp
        chmod --reference ${FILE} ${FILE}.tmp
        mv ${FILE}.tmp ${FILE}
        echo "Done!"
      else
        echo "New string '${NEW_STRING}' is longer than old string '${OLD_STRING}'. Skipping."
      fi
    done
  fi
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "${_name//-/_}-${pkgver}-${_py}-${_py}-manylinux2014_${CARCH}.manylinux_2_17_${CARCH}.whl"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vs "${site_packages}/${_name}-${pkgver}.dist-info/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${pkgdir}${site_packages}/${_name}"
  find . -type f -name '*312*' -exec \
    sh -c 'mv "$0" "${0//312/313}"' "{}" \;
  
  find . -type f -executable -print0 | \
    while IFS= read -r -d '' file; do
      _patch_strings_in_file "${file}" "_PyThreadState_UncheckedGet" "PyThreadState_GetUnchecked"
    done
}
