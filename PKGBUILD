pkgname=anbox-image-gapps
pkgver=2018.07.19
_gappsver=20190227
pkgrel=3
pkgdesc="Android image for running in Anbox, with Opengapps and houdini"
arch=('x86_64')
url="https://anbox.io"
license=('custom')
makedepends=('lzip' 'squashfs-tools' 'unzip')
optdepends=('anbox-bridge: Enable network for anbox.')

# anbox image
source=("http://build.anbox.io/android-images/${pkgver//./\/}/android_amd64.img")
# opengapps
source+=("https://github.com/opengapps/x86_64/releases/download/${_gappsver}/open_gapps-x86_64-7.1-mini-${_gappsver}.zip")
# houdini
source+=("http://dl.android-x86.org/houdini/7_y/houdini.sfs")
# libhoudini
source+=("https://github.com/Rprop/libhoudini/raw/master/4.0.8.45720/system/lib/libhoudini.so")

sha256sums=('6b04cd33d157814deaf92dccf8a23da4dc00b05ca6ce982a03830381896a8cca'
            'f2f6db7d174c5c17293f1e4399d4b0174940bf1e1cdec10b2fd0cb0707f42747'
            '56fd08c448840578386a71819c07139122f0af39f011059ce728ea0f3c60b665'
            '2d15d126e46ea933a92fcc6dd30ad2c93d063af322fc1ba84aaa4f3e75d84e68')
noextract=('android_amd64.img'
	'open_gapps-x86_64-7.1-mini-20190203.zip'
	'houdini.sfs'
	'libhoudini.so')

provides=('anbox-image')
conflicts=('anbox-image')

build () {
	cd "${srcdir}"
	
	# unsquash anbox image
	unsquashfs android_amd64.img

	# install opengapps
	unzip -d opengapps ./open_gapps-x86_64-7.1-mini-${_gappsver}.zip

	cd ./opengapps/Core/
	for filename in *.tar.lz
	do
		tar --lzip -xvf ./${filename}
	done

	cd "${srcdir}"

	cp -r ./$(find opengapps -type d -name "PrebuiltGmsCore")			./squashfs-root/system/priv-app/
	cp -r ./$(find opengapps -type d -name "GoogleLoginService")		./squashfs-root/system/priv-app/
	cp -r ./$(find opengapps -type d -name "Phonesky")					./squashfs-root/system/priv-app/
	cp -r ./$(find opengapps -type d -name "GoogleServicesFramework")	./squashfs-root/system/priv-app/

	# load houdini
	mkdir -p houdini
	unsquashfs -f -d ./houdini ./houdini.sfs

	cp -r ./houdini/houdini ./squashfs-root/system/bin/
	cp -r ./houdini/xstdata ./squashfs-root/system/bin/
	cp ./libhoudini.so ./squashfs-root/system/lib/
	
	mkdir -p ./squashfs-root/system/lib/arm
	cp -r ./houdini/linker	./squashfs-root/system/lib/arm/
	cp -r ./houdini/*.so 	./squashfs-root/system/lib/arm/
	cp -r ./houdini/nb		./squashfs-root/system/lib/arm/

	# add houdini parser
	mkdir -p ./squashfs-root/system/etc/binfmt_misc
	echo ":arm_dyn:M::\x7f\x45\x4c\x46\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x28::/system/bin/houdini:" >> ./squashfs-root/system/etc/binfmt_misc/arm_dynp 
	echo ":arm_exe:M::\x7f\x45\x4c\x46\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28::/system/bin/houdini:" >> ./squashfs-root/system/etc/binfmt_misc/arm_exe

	# add features
	_C=$(cat <<-END
		<feature name="android.hardware.touchscreen" />\n
		<feature name="android.hardware.audio.output" />\n
		<feature name="android.hardware.camera" />\n
		<feature name="android.hardware.camera.any" />\n
		<feature name="android.hardware.location" />\n
		<feature name="android.hardware.location.gps" />\n
		<feature name="android.hardware.location.network" />\n
		<feature name="android.hardware.microphone" />\n
		<feature name="android.hardware.screen.portrait" />\n
		<feature name="android.hardware.screen.landscape" />\n
		<feature name="android.hardware.wifi" />\n
		<feature name="android.hardware.bluetooth" />"
	END
	)

    _C=$(echo ${_C} | sed 's/\//\\\//g')
    _C=$(echo ${_C} | sed 's/\"/\\\"/g')
    sed -i "/<\/permissions>/ s/.*/${_C}\n&/" ./squashfs-root/system/etc/permissions/anbox.xml

    # make wifi and bt available
    sed -i "/<unavailable-feature name=\"android.hardware.wifi\" \/>/d" ./squashfs-root/system/etc/permissions/anbox.xml
    sed -i "/<unavailable-feature name=\"android.hardware.bluetooth\" \/>/d" ./squashfs-root/system/etc/permissions/anbox.xml

    # set processors
    _ARM_TYPE=",armeabi-v7a,armeabi"
    sed -i "/^ro.product.cpu.abilist=x86_64,x86/ s/$/${_ARM_TYPE}/" ./squashfs-root/system/build.prop
    sed -i "/^ro.product.cpu.abilist32=x86/ s/$/${_ARM_TYPE}/" ./squashfs-root/system/build.prop

    echo "persist.sys.nativebridge=1" >> ./squashfs-root/system/build.prop

    # enable opengles
    echo "ro.opengles.version=131072" >> ./squashfs-root/system/build.prop
}

package() {
	cd "${srcdir}"
	
	# set owner
	chown -R 100000:100000 ./squashfs-root/system/priv-app/{Phonesky,GoogleLoginService,GoogleServicesFramework,PrebuiltGmsCore}
	chown -R 100000:100000 ./squashfs-root/system/bin/{xstdata,houdini}
	chown -R 100000:100000 ./squashfs-root/system/lib/{libhoudini.so,arm}
	chown -R 100000:100000 ./squashfs-root/system/etc/binfmt_misc

    # squash image
    cd "${srcdir}"
    mksquashfs squashfs-root android.img -b 131072 -comp xz -Xbcj x86
    
    #install image	
	install -Dm644 ./android.img "${pkgdir}/"var/lib/anbox/android.img
}
    
