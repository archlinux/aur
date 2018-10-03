# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>
# Contributor: Alex Brinister <alex_brinister at yahoo dot com>

pkgname=rmtoo
pkgver=r1093.7f53e5d
pkgrel=1
pkgdesc="Free and Open Source Requirements Management Tool"
arch=(any)
url="http://www.rmtoo.florath.net"
license=(GPL3)
depends=('python' 
  'texlive-core' 
  'graphviz' 
  'python-scipy' 
  'gnuplot' 
  'python-odfpy' 
  'python-numpy' 
  'python-stevedore'
  'python-yaml'
  'python-gitpython'
  'python-gitdb'
  'python-future'
  'python-pylint'
  'python-jinja')
makedepends=('python' 'python-setuptools' 'python-wheel' 'git')
provides=('rmtoo')
conflicts=('rmtoo')

#source=("https://github.com/florath/rmtoo/archive/${pkgver}.tar.gz")
#sha512sums=('4601efe09d54138563dad6599fc43c006a553e2c94eff9eccb1ec16a7e12c743c05ee10c42896b205b99c72b62ac717c057bc5fc68956473b1739f21f0c646fe')
source=('rmtoo::git+https://github.com/alexbrinister/rmtoo.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 "${srcdir}/${pkgname}/gpl-3.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Dissolve the weird /usr/rmtoo folder
  install -m755 -d "${pkgdir}/usr/share/docs/${pkgname}/"
  find "${pkgdir}/usr/${pkgname}/doc/readme" -maxdepth 1 -type f -name "*.txt" -o -name "*.rst" -exec install -m644 {} ${pkgdir}/usr/share/doc/${pkgname}/{} \;
 
  install -m755 -d "${pkgdir}/usr/share/${pkgname}"
  cp -r "${pkgdir}/usr/${pkgname}/contrib" "${pkgdir}/usr/share/${pkgname}/"
  find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod -R 644 {} \;
  find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod -R 755 {} \;
	rm -rf "${pkgdir}/usr/${pkgname}"

  # Fix the template_project Makefile to reflect the new contrib directory

  sed -i -e 's|\/usr\/local\/pkg\/rmtoo\/rmtoo|\/usr\/share\/'"${pkgname}"'|g' "${pkgdir}/usr/share/${pkgname}/contrib/template_project/Makefile"
}

# vim: set expandtab ts=2 sw=2:
