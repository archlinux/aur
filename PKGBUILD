# Maintainer: Iliya Ivanov <i.ivanov@proforge.org>

_pkgname=pgadmin4
pkgname=${_pkgname}-venv
pkgver=5.4
pkgrel=1
pkgdesc='Comprehensive design and management interface for PostgreSQL'
url='https://www.pgadmin.org/'
arch=('x86_64')
license=('custom')
replaces=("${_pkgname}")
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
depends=('postgresql-libs' 'python')
makedepends=('python-pip')
source=(pgAdmin4.desktop pgAdmin4.png arch_additions.py arch_patches.patch)
sha512sums=(
	'e5db1a1924252f4e3aa076352b39ffe2006b79cc9153105ab3438f724a993badf29a8eb6c0ffaa615fc9fdd6ee1c8cc62ba7a1059cf5bd9beff11a7d977d6ad8'
	'be2872cd2a3009dea0cff03be122e43085e8aa5e792ec8724deafd9ddf719a3655a0500b03476c0d85d96632952613802825d3cd1566a7de4d75780ca911bdb4'
	'1b762613273ead0cb93b8d9d586cfc101c3bea3fb5588ca2f3a5ca8476b18c46e7b11c15f29a7c7d08190df48c082b09ee3b10fedc154dfa6141f8c71f2da4fb'
	'4741de879e90a0dd267abc060a9b867ebae55d15f233a9896a5c067624bb3b5ffb80ea9feb6383262276c3e450d863b3a2125f2039b41f50feb1accfa5514a89'
)

package() {

	local PYTHONVERSION="$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"

	python -m venv "${pkgdir}/opt/pgadmin4/"
	source ${pkgdir}/opt/pgadmin4/bin/activate
	pip install pgadmin4==${pkgver}

	# for better websocket experience
	pip install simple-websocket

	# reinstall to avoid an alignment error
	pip install psycopg2==2.8.*

	# used for KDE tray icon
	pip install PyQt5
	
	patch -Np1 -d ${pkgdir}/opt/pgadmin4/lib/python${PYTHONVERSION}/ < arch_patches.patch
	
	find ${pkgdir}/opt/pgadmin4/bin -type f -exec sed -i "s|${pkgdir}||g" {} \;
	
	install -Dm 644 "${srcdir}"/arch_additions.py -t "${pkgdir}/opt/pgadmin4/lib/python${PYTHONVERSION}/site-packages/pgadmin4"

	install -Dm 644 "${srcdir}"/pgAdmin4.png -t "${pkgdir}/opt/pgadmin4"
	install -Dm 644 "${srcdir}/pgAdmin4.desktop" -t "${pkgdir}/usr/share/applications"

	install -D /dev/stdin "${pkgdir}/usr/bin/pgadmin4" <<END
#!/bin/sh
cd /opt/pgadmin4
source bin/activate
#export PGADMIN_INT_PORT=\$(python -c 'import socket; s=socket.socket(); s.bind(("", 0)); print(s.getsockname()[1]); s.close()');
export PGADMIN_SERVER_MODE='OFF'
python lib/python${PYTHONVERSION}/site-packages/pgadmin4/pgAdmin4.py "\$@"
END

}
