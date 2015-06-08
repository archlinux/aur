# Maintainer: Ashley Whetter <(firstname) at awhetter couk>

# Note: sesinet is installed to /opt/houdini/houdini/sbin
# Note: You may want to add /opt/houdini/bin to your PATH

pkgname=('houdini' 'houdini-maya-engine' 'hqueue-server' 'hqueue-client')
pkgbase=houdini
_pkgver_major=14
_pkgver_minor=0
_pkgver_build=201.13
pkgver=${_pkgver_major}.${_pkgver_minor}.${_pkgver_build}
pkgrel=2
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
_validgccs=(4.4 4.6 4.8)
# Use the latest gcc version available if there isn't a known version installed
[[ ${_validgccs[@]} =~ $_gccver ]] || _gccver=${_validgccs[@]:(-1)}

source=(file://${pkgname}-${pkgver}-linux_x86_64_gcc${_gccver}.tar.gz)
[[ "$_gccver" == 4.8 ]] && sha1sums=('af8caa68e169b694c1b3d17f4a0df4604446ebf1')
[[ "$_gccver" == 4.6 ]] && sha1sums=('93d7d204be771d474cf0d4d98aa90b1460f4f536')
[[ "$_gccver" == 4.4 ]] && sha1sums=('d1504e00377426f046956f90ef02139d6da43094')

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

	# installing profile files
	install -Dm755 ${pkgdir}/opt/houdini/houdini_setup_bash ${pkgdir}/etc/profile.d/houdini.sh
	install -Dm755 ${pkgdir}/opt/houdini/houdini_setup_csh ${pkgdir}/etc/profile.d/houdini.csh

	sed -i '1icd /opt/houdini' ${pkgdir}/etc/profile.d/houdini.sh
	sed -i '1icd /opt/houdini' ${pkgdir}/etc/profile.d/houdini.csh

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

	for year in {2012,2013,2013.5,2014}
	do
		install -d ${pkgdir}/usr/autodesk/maya${year}-x64/modules
		cp ${pkgdir}/opt/houdini/engine/maya/maya${year}/houdiniEngine-maya${year} ${pkgdir}/usr/autodesk/maya${year}-x64/modules
	done

	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# If you use easy_install then it may be easier to install
# ${srcdir}/houdini-${pkgver}-linux_x86_64_gcc${_gccver}/hqueue/hqserver-${pkgver}-py2.7.egg
package_hqueue-server() {
	pkgver=14.0.201.13
	depends=('mysql' 'python2>=2.7' 'python2-webtest' 'python2-nose' 'python2-virtualenv' 'python2-weberror' 'python2-paramiko' 'python2-pylons' 'python2-rpyc' 'python2-paste' 'python2-paste-deploy' 'python2-sqlalchemy' 'python2-pygments' 'python2-routes' 'python2-webhelpers' 'python2-simplejson' 'python2-tempita' 'python2-beaker' 'python2-wsgiref' 'python2-mako' 'python2-decorator' 'python2-paste-script' 'python2-webob' 'python2-crypto' 'python2-formencode')
	makedepends=('python2-setuptools')

	cd ${srcdir}/houdini-${pkgver}-linux_x86_64_gcc${_gccver}
	tar xzf hqueue.tar.gz

	for file in {hqserverd,create_shared_drive.sh,hserver}
	do
		install -Dm755 hqueue/scripts/$file ${pkgdir}/opt/hqueue-server/scripts/$file
	done

	sed -i -e 's|%%INSTALL_DIR%%|/opt/hqueue-server|' ${pkgdir}/opt/hqueue-server/scripts/hqserverd

	# TODO: hqueue/deps/indep/*
	install -d ${pkgdir}/opt/hqueue-server
	cd hqueue
	unzip -o hqserver-${pkgver}-py2.7.egg
	cp -a hqserver/* ${pkgdir}/opt/hqueue-server
}

# If you use easy_install then it may be easier to install
# ${srcdir}/houdini-${pkgver}-linux_x86_64_gcc${_gccver}/hqueue/hqclient-${pkgver}-py2.7.egg
package_hqueue-client() {
	pkgver=14.0.201.13
	makedepends=(unzip)

	cd ${srcdir}/houdini-${pkgver}-linux_x86_64_gcc${_gccver}
	tar xzf hqueue.tar.gz

	install -d ${pkgdir}/opt/hqueue-client
	cd hqueue
	unzip -o hqserver-${pkgver}-py2.7.egg
	cp -a hqserver/client/* ${pkgdir}/opt/hqueue-client
}
