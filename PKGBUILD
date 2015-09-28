# Maintainer: Jason <jsfaint@gmail.com>
# Contributor: Kuro <kurokarazu@gmail.com>
pkgname=kuaipan4uk
pkgver=2.0.0.5
pkgrel=1
pkgdesc="Kingsoft KuaiPan is one of the most popular cloud storage service in China. The aim of this project is to provide an easy-to-use KuaiPan client for UbuntuKylin and all Linux users."
arch=('i686' 'x86_64')
license=("GPL")
url="http://www.ubuntukylin.com/applications/showimg.php?lang=cn&id=21"
depends=('qt4' 'zlib' 'freetype2' 'libsm' 'libxrender' 'libxext' 'bzip2' 'icu' 'rtmpdump' 'crypto++' 'nss' 'libqxt')

if [ "$CARCH" = "i686" ]; then
    source="http://archive.ubuntukylin.com:10006/ubuntukylin/pool/main/k/kuaipan4uk/kuaipan4uk_2.0.0.5_i386.deb"
    md5sums='a1d125a968b2a5099d8d7ee0291ff4e6'
elif [ "$CARCH" = "x86_64" ]; then
    source="http://archive.ubuntukylin.com:10006/ubuntukylin/pool/main/k/kuaipan4uk/kuaipan4uk_2.0.0.5_amd64.deb"
    md5sums='d9b6804c3679269c5cc99407f2ac7409'
fi

#Check if libcurl exists
if ! [ -f ${pkgdir}/opt/ubuntukylin/${pkgname}/lib/libcurl.so.4.2.0 ]; then
    curl_ver="curl-7.23.1"
    source+=("http://curl.haxx.se/download/curl-7.23.1.tar.gz")
    md5sums+=('8e23151f569fb54afef093ac0695077d')
fi

build_libcurl()
{
    #Build libcurl
    cd ${srcdir}
    tar xf ${curl_ver}.tar.gz
    cd ${curl_ver}

    ./configure \
        --prefix=/ \
        --disable-ldap \
        --disable-ldaps \
        --enable-ipv6 \
        --enable-manual \
        --enable-versioned-symbols \
        --enable-threaded-resolver \
        --without-libidn \
        --with-random=/dev/urandom \
        --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
        --with-ssl \
        --with-nss

    make
}

install_libcurl()
{
    local dst_dir="${pkgdir}/opt/ubuntukylin/${pkgname}"

    #install libcurl
    cd ${srcdir}/${curl_ver}
    make DESTDIR="$dst_dir" install

    #Remove curl binary
    rm ${dst_dir}/bin/curl
    rm ${dst_dir}/bin/curl-config

    #Remove man page
    rm ${dst_dir}/share -rf

    #Remove header file, we don't need it
    rm -rf ${dst_dir}/include
    rm -rf ${dst_dir}lib/libcurl.a
    rm -rf ${dst_dir}/lib/libcurl.la
    rm -rf ${dst_dir}/lib/pkgconfig

    cd $dst_dir/lib
    ln -s libcurl.so.4.2.0 libcurl-nss.so.4
}

fix_boost_libs()
{
    local pkglib="${pkgdir}/opt/ubuntukylin/${pkgname}/lib"
    lib_list="libboost_filesystem.so libboost_iostreams.so libboost_regex.so libboost_system.so libboost_thread.so"

    cd ${pkglib}
    #Create symbolic links
    for i in ${lib_list}; do
        rm -f $i #Remove old symbolic link
        ln -s -f /usr/lib/${i} ${i}.1.54.0
    done
}

package()
{
    local pkglib="/opt/ubuntukylin/${pkgname}/lib"

    #Extract kuaipan4uk
    tar xf ${srcdir}/data.tar.xz -C ${pkgdir}/
    rm -f ${pkgdir}/usr/share/keyrings/kuaipan-archive-keyring.gpg
    #rm -f ${pkgdir}/etc/apt/sources.list.d/kuaipan.list
    #rmdir ${pkgdir}/etc/apt/sources.list.d
    #rmdir ${pkgdir}/etc/apt

    #Insert lib and run as kuaipan4uk_script
    sed -i '2iexport LD_LIBRARY_PATH='${pkglib}':$LD_LIBRARY_PATH' ${pkgdir}/opt/ubuntukylin/${pkgname}/bin/kuaipan4uk_script
    sed -i "s/bin\/kuaipan4uk/bin\/kuaipan4uk_script/g" ${pkgdir}/usr/share/applications/kuaipan4uk.desktop

    #Create symbolic link
    local libcrypto="/usr/lib/libcryptopp.so"
    if [[ -e ${libcrypto} ]]; then
        cd ${pkgdir}${pkglib}
        ln -s ${libcrypto} libcrypto++.so.9
    fi

    fix_boost_libs

    #make libcurl if not exists
    if [ -f ${pkglib}/libcurl.so.4.2.0 ]; then
        cd ${pkgdir}${pkglib}
        cp ${pkglib}/libcurl.so.4.2.0 .
        ln -s libcurl.so.4.2.0 libcurl-nss.so.4
        ln -s libcurl.so.4.2.0 libcurl.so
        ln -s libcurl.so.4.2.0 libcurl.so.4
    else
        build_libcurl
        install_libcurl
    fi

}
