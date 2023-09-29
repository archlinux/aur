# Maintainer: Carl Kittelberger <icedream@icedream.pw>
pkgname=procertum-cardmanager
pkgver=2.2.11
pkgrel=2
epoch=
pkgdesc="Management of certificate profiles installed on the cryptoCertum card."
arch=(x86_64)
url="https://www.support.certum.eu/en/cert-offer-card-manager/"
license=(unknown)
provides=()
source=(
	"https://files.certum.eu/software/proCertumCardManager/Linux-Ubuntu/${pkgver}/proCertumCardManager-${pkgver}-${CARCH}-ubuntu.bin"
)
md5sums=('9769be541d4a57ab20900c7b634e2b1b')

prepare() {
	sh "./proCertumCardManager-${pkgver}-${CARCH}-ubuntu.bin" --noexec --keep --nox11 --nochown --target "${srcdir}/${pkgname}-${pkgver}"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	#./zz_install

	INSTALL_DIR="$pkgdir/opt/proCertumCardManager"

	USER_DESKTOP_FILE=proCertumCardManager.desktop

	SYSTEM_LIBRARY_INSTALL_DEFAULT_DIR="$pkgdir/usr/lib64"
	SYSTEM_LIBRARY_INSTALL_DEFAULT_SECOND_DIR="$pkgdir/usr/lib"
	SYSTEM_LIBRARY_INSTALL_DIR=$SYSTEM_LIBRARY_INSTALL_DEFAULT_DIR
	SYSTEM_LIBRARY_INSTALL_LINK_DIR=$SYSTEM_LIBRARY_INSTALL_DEFAULT_SECOND_DIR

	PKCS11_COMMON_PROFILE_LIBRARY_DIR=crypto3PKCS
	PKCS11_COMMON_PROFILE_LIBRARY=$(printf "%s" sc30pkcs11-*-MS.so)
	PKCS11_COMMON_PROFILE_LIBRARY_LINK=libcrypto3PKCS.so
	PKCS11_SECURE_PROFILE_LIBRARY_DIR=cryptoCertum3PKCS
	PKCS11_SECURE_PROFILE_LIBRARY=$(printf "%s" cryptoCertum3PKCS-*-MS.so)
	PKCS11_SECURE_PROFILE_LIBRARY_LINK=libcryptoCertum3PKCS.so

	SYSTEM_LIBRARY_INSTALL_DIR=$SYSTEM_LIBRARY_INSTALL_DEFAULT_SECOND_DIR

	mkdir -p "$SYSTEM_LIBRARY_INSTALL_DIR"

	mkdir -p "$INSTALL_DIR"
	cp -R -a * "$INSTALL_DIR"
	chown -R root:root "$INSTALL_DIR"
	chmod 755 "$INSTALL_DIR"

	mkdir $SYSTEM_LIBRARY_INSTALL_DIR/$PKCS11_COMMON_PROFILE_LIBRARY_DIR
	chown root:root $SYSTEM_LIBRARY_INSTALL_DIR/$PKCS11_COMMON_PROFILE_LIBRARY_DIR
	chmod 755 $SYSTEM_LIBRARY_INSTALL_DIR/$PKCS11_COMMON_PROFILE_LIBRARY_DIR

	cp -a $PKCS11_COMMON_PROFILE_LIBRARY $SYSTEM_LIBRARY_INSTALL_DIR/$PKCS11_COMMON_PROFILE_LIBRARY_DIR
	chown root:root $SYSTEM_LIBRARY_INSTALL_DIR/$PKCS11_COMMON_PROFILE_LIBRARY_DIR/$PKCS11_COMMON_PROFILE_LIBRARY
	rm -f $SYSTEM_LIBRARY_INSTALL_LINK_DIR/$PKCS11_COMMON_PROFILE_LIBRARY_LINK
	ln -rs $SYSTEM_LIBRARY_INSTALL_DIR/$PKCS11_COMMON_PROFILE_LIBRARY_DIR/$PKCS11_COMMON_PROFILE_LIBRARY $SYSTEM_LIBRARY_INSTALL_LINK_DIR/$PKCS11_COMMON_PROFILE_LIBRARY_LINK

	mkdir $SYSTEM_LIBRARY_INSTALL_DIR/$PKCS11_SECURE_PROFILE_LIBRARY_DIR
	chown root:root $SYSTEM_LIBRARY_INSTALL_DIR/$PKCS11_SECURE_PROFILE_LIBRARY_DIR
	chmod 755 $SYSTEM_LIBRARY_INSTALL_DIR/$PKCS11_SECURE_PROFILE_LIBRARY_DIR

	cp -a $PKCS11_SECURE_PROFILE_LIBRARY $SYSTEM_LIBRARY_INSTALL_DIR/$PKCS11_SECURE_PROFILE_LIBRARY_DIR
	chown root:root $SYSTEM_LIBRARY_INSTALL_DIR/$PKCS11_SECURE_PROFILE_LIBRARY_DIR/$PKCS11_SECURE_PROFILE_LIBRARY
	rm -f $SYSTEM_LIBRARY_INSTALL_LINK_DIR/$PKCS11_SECURE_PROFILE_LIBRARY_LINK
	ln -rs $SYSTEM_LIBRARY_INSTALL_DIR/$PKCS11_SECURE_PROFILE_LIBRARY_DIR/$PKCS11_SECURE_PROFILE_LIBRARY $SYSTEM_LIBRARY_INSTALL_LINK_DIR/$PKCS11_SECURE_PROFILE_LIBRARY_LINK

	# remove installer scripts
	rm "$INSTALL_DIR"/zz_* "$INSTALL_DIR"/proCertumCardManager_uninstall_pl

	# install link to binary
	mkdir -p "$pkgdir/usr/bin"
	ln -rs "$pkgdir/opt/proCertumCardManager/proCertumCardManager" "$pkgdir/usr/bin/"

	# install desktop file
	mkdir -p "$pkgdir/usr/share/applications"
	cp -R -a "$USER_DESKTOP_FILE" "$pkgdir/usr/share/applications/"
}
