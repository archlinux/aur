# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>
# Contributor: Alex Brinister <alex_brinister at yahoo dot com>

pkgname=rmtoo
pkgver=25.0.1
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

source=("https://github.com/florath/rmtoo/archive/${pkgver}.tar.gz")
sha512sums=('5b6f7bc7fdb37553b9c1e25cd5d2f8c701e890be9f7f8ba2be7602a215d0c7f9a50426969dc078265ec60ce7617baa310dd1d96db14ce1998287cd3cb22d9b0b')
#source=('rmtoo::git+https://github.com/alexbrinister/rmtoo.git')
#md5sums=('SKIP')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 "gpl-3.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Dissolve the weird /usr/rmtoo folder
  install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}/"
  for doc in ${pkgdir}/usr/${pkgname}/doc/readme/*
  do
    install -m644 $doc ${pkgdir}/usr/share/doc/${pkgname}/
  done
 
  install -m755 -d "${pkgdir}/usr/share/${pkgname}"
  cp -r "${pkgdir}/usr/${pkgname}/contrib" "${pkgdir}/usr/share/${pkgname}/"
  find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod -R 644 {} \;
  find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod -R 755 {} \;
	rm -rf "${pkgdir}/usr/${pkgname}"

  # Fix the template_project Makefile to reflect the new contrib directory

  sed -i -e 's|\/usr\/local\/pkg\/rmtoo\/rmtoo|\/usr\/share\/'"${pkgname}"'|g' "${pkgdir}/usr/share/${pkgname}/contrib/template_project/Makefile"
}

# vim: set expandtab ts=2 sw=2:
