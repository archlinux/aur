# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=airnef
pkgname="python-${_name}"
pkgver=1.1
pkgrel=5
pkgdesc="Wireless download from your Nikon/Sony/Canon camera"
arch=('any')
url="https://testcams.com/airnef/"
license=('GPL3')
depends=('python' 'tk')
source=("https://testcams.com/airnef/Version_1.1/airnef_v1.1_Source.zip"
        "airnef-linux.patch")
sha512sums=('b45b0591e42179d1e5b5eea9ede6762d311cd0642585c54568c90111424e2ca316aa444d772b4855afe42f25b6cc4b3e1b78bb5a0c2a4cb52440535894a5cba6'
            '2ebf9eda9c354f73a1a3084eca706c1d30d67737101d5bfb69474984f636ce5dc52092cec3de2d04e8ac61afa26ffe78e41dbf1a2fee5955af2ceed75620f154')
DLAGENTS=('https::/usr/bin/curl --insecure -fLC - --retry 3 --retry-delay 3 -o %o %u')


prepare() {
  cd "${srcdir}/${_name}"

  patch -N -p1 -i "${srcdir}"/airnef-linux.patch
}

package() {
  cd "${srcdir}/${_name}"

  local py_ver=$(python -c 'import sys; print("%i.%i" % sys.version_info[:2])')
  local package_dir="/usr/lib/python${py_ver}/site-packages/$_name"
  install -dm755 "${pkgdir}${package_dir}"/appresource
  install *.py "${pkgdir}${package_dir}"
  install airnef.pyw "${pkgdir}${package_dir}"/airnef.py
  install appresource/* "${pkgdir}${package_dir}"/appresource/
  install -dm755 "${pkgdir}"/usr/bin
  ln -s "${package_dir}"/airnef.py "${pkgdir}"/usr/bin/airnef
  ln -s "${package_dir}"/airnefcmd.py "${pkgdir}"/usr/bin/airnefcmd
}
