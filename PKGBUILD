# Contributor: Alex Brinister <alex_brinister at yahoo dot com>

pkgname=rmtoo
pkgver=26.0.2
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
  'python-stevedore'
  'python-yaml'
  'python-gitpython'
  'python-jinja'
  'python-setuptools') # distutils
provides=('rmtoo')
conflicts=('rmtoo')

source=("https://github.com/florath/rmtoo/archive/v${pkgver}.tar.gz")
sha512sums=('f72f185086bf238f85a91ad996a160f125b199ba39baeb7a4e202f3093c16ba8a05f4e2988affc021f541dee1abb01308b2ecfc37e163887f9be5f62a2676b1f')


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
