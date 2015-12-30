# Maintainer: Ashley Whetter <(firstname) at awhetter couk>

# Note: You will need to start the sesinetd service before running houdini
# Note: You may want to add /opt/houdini/bin to your PATH

pkgname=('houdini' 'houdini-maya-engine' 'python2-hqueue')
pkgbase=houdini
_pkgver_major=15
_pkgver_minor=0
_pkgver_build=313
pkgver=${_pkgver_major}.${_pkgver_minor}.${_pkgver_build}
pkgrel=1
pkgdesc="High-end 3D animation package"
arch=('x86_64')
url="http://www.sidefx.com/"
license=('Custom: Side Effects Software')
depends=()
makedepends=()
options=('!strip')
install=(houdini.install)

_gccver=$(gcc -dumpversion)
_gccver=${_gccver%.[0-9]*}
_validgccs=(4.8)
# Use the latest gcc version available if there isn't a known version installed
[[ ${_validgccs[@]} =~ $_gccver ]] || _gccver=${_validgccs[@]:(-1)}

# The file needs to be downloaded manually
source=(file://${pkgname}-${pkgver}-linux_x86_64_gcc${_gccver}.tar.gz)
[[ "$_gccver" == 4.8 ]] && sha1sums=('7ba7e43cad39019d7b9cdaa125c5849514200fe2')

source+=('LICENSE' 'sesinetd.service')
sha1sums+=('3b639ee438fdb390b8b302000987d80df100a3c9' 'b6eca8f67aeedb9c5b7a5863c3d24edaf2b93cf3')

package_houdini() {
	depends=('intel-tbb>=4.3' 'boost-libs>=1.55.0' 'zlib>=1.2.7' 'libtiff>=3.9.2')
	optdepends=('python2>=2.7.5: Python scripting'
	'python2-demjson: Python scripting'
	'libxml2>=2.8.0: Scripting'
	'bullet>=2.81: Dynamic solver'
	'ode>=0.10.1: Dynamic solver'
	'fbx-sdk>=4.3: Data exchange'
	'alembic>=1.5.2: Data exchange'
	'openexr>=2.2.0: Data exchange'
	'opensubdiv'
	'python2-flask: In application documentation browser'
	'python2-pygments: In application documentation browser'
	)
#Collada: Data exchange
#openvdb: Data exchange
#field3d: Data exchange

	cd ${srcdir}/houdini-${pkgver}-linux_x86_64_gcc${_gccver}

	install -d ${pkgdir}/opt/houdini
	tar xzf houdini.tar.gz -C ${pkgdir}/opt/houdini

	for i in {gplay,hkey,houdini,houdinifx,hescape,hindie,mplay,hview,happrentice,orbolt_url};
	do
		sed -i 's|${HFS}|/opt/houdini|g' desktop/sesi_${i}.desktop
		sed -i 's|${VER_MAJOR}|'${_pkgver_major}'|g' desktop/sesi_${i}.desktop
		sed -i 's|${VER_MINOR}|'${_pkgver_minor}'|g' desktop/sesi_${i}.desktop
		sed -i 's|${VER_BUILD}|'${_pkgver_build}'|g' desktop/sesi_${i}.desktop
		install -Dm644 desktop/sesi_${i}.desktop ${pkgdir}/usr/share/applications/sesi_${i}.desktop
	done

	install -Dm644 desktop/sesi_houdini.menu ${pkgdir}/etc/xdg/menus/applications-merged/sesi_houdini.menu

	install -Dm644 desktop/sesi_houdini.menu ${pkgdir}/etc/xdg/menus/kde-applications-merged/sesi_houdini.menu

	for i in {hip,hiplc,hipnc,otl,otllc,otlnc,hda,hdalc,hdanc,pic,piclc,picnc,geo,bgeo,orbolt}
	do
		install -Dm644 "mime/application-x-${i}.xml" "${pkgdir}/usr/share/mime/packages/application-x-${i}.xml"
	done

	# installing license
	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE

	install -Dm644 ${srcdir}/sesinetd.service ${pkgdir}/usr/lib/systemd/system/sesinetd.service
}

package_houdini-maya-engine() {
	url="http://www.sidefx.com/index.php?option=com_content&task=view&id=2738&Itemid=381"
	depends=("houdini=$pkgver")

	cd ${srcdir}/houdini-${pkgver}-linux_x86_64_gcc${_gccver}

	install -d ${pkgdir}/opt/houdini/engine/maya
	tar xzf engine_maya.tar.gz -C ${pkgdir}/opt/houdini/engine/maya

	sed -i -e 's|REPLACE_WITH_HFS|/opt/houdini|' \
		$(find "${pkgdir}/opt/houdini/engine/maya" -mindepth 2 -maxdepth 2 -type f -name "houdiniEngine-*")

	for year in {2012,2013,2013.5,2014,2015,2016}
	do
		install -d ${pkgdir}/usr/autodesk/maya${year}-x64/modules
		cp ${pkgdir}/opt/houdini/engine/maya/maya${year}/houdiniEngine-maya${year} ${pkgdir}/usr/autodesk/maya${year}-x64/modules
	done

	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

package_python2-hqueue() {
	depends=('mysql' 'python2>=2.7' 'python2-beaker' 'python2-decorator' 'python2-formencode' 'python2-mako' 'python2-nose' 'python2-paramiko' 'python2-paste' 'python2-paste-deploy' 'python2-paste-script' 'python2-crypto' 'python2-pycurl' 'python2-pygments' 'python2-pylons' 'python2-routes' 'python2-rpyc' 'python2-setuptools' 'python2-simplejson' 'python2-sqlalchemy' 'python2-tempita' 'python2-virtualenv' 'python2-weberror' 'python2-webhelpers' 'python2-webob' 'python2-webtest' 'python2-wsgiref')

	cd ${srcdir}/houdini-${pkgver}-linux_x86_64_gcc${_gccver}
	tar xzf hqueue.tar.gz

	for file in {hqserverd,create_shared_drive.sh,hserver}
	do
		install -Dm755 hqueue/scripts/$file ${pkgdir}/opt/hqueue/scripts/$file
	done

	sed -i -e 's|%%INSTALL_DIR%%|/opt/hqueue|' ${pkgdir}/opt/hqueue/scripts/hqserverd

	# TODO: hqueue/deps/indep/*
	# TODO: Convert hqueue/scripts/hqserverd to systemd unit
	install -d ${pkgdir}/usr/lib/python2.7/site-packages
	install -Dm644 hqueue/hqserver-${pkgver}-py2.7.egg ${pkgdir}/usr/lib/python2.7/site-packages
	echo ./hqserver-${pkgver}-py2.7.egg >> ${pkgdir}/usr/lib/python2.7/site-packages/hqserver.pth
}
