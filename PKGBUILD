# Maintainer: Alan Orth <aorth@mjanja.ch>
pkgdesc="Header files and scripts for Clear Linux kernel and modules"
url="https://clearlinux.org/node/15538"
pkgname=linux-clear-headers-bin
# check org.clearlinux.native.X.Y.Z in Manifest
_major=5.7
_minor=4
_clr=964
pkgver=${_major}.${_minor}.${_clr}
pkgrel=1
# use in case we need to update the Arch package without incrementing pkgrel
epoch=0
arch=('x86_64')
license=('GPL2')
conflicts=("linux-clear-headers")
options=('!strip')

# see: https://cdn.download.clearlinux.org/current/latest
_clear_version=33400
_kernel_version="${_major}.${_minor}-${_clr}.native"
# hash of kernel config from Manifest.linux-dev, ie /usr/lib/kernel/config-5.3.1-843.native
# there's no way to do this automatically in the PKGBUILD
_config_hash=74f0500b3b4d74198a194a114716d1530122362cb7abc37328def52a131f3f6c

source=("Manifest.linux-dev.${_clear_version}::https://cdn.download.clearlinux.org/update/${_clear_version}/Manifest.linux-dev"
        "pack-linux-dev-from-0.${_clear_version}.tar::https://cdn.download.clearlinux.org/update/${_clear_version}/pack-linux-dev-from-0.tar"
        "https://cdn.download.clearlinux.org/update/${_clear_version}/files/${_config_hash}.tar"
)
b2sums=('a8c3b21b22628066c9ad063687897529e269482b0261d68e3d47b60176020336ee5b1205ad52c8fd4730cb62b7064cf18a58e1827c1c7c5f7cedc284ffa86726'
        '118ad0841583ccf3851ba8416bf06d6b5cdba4caf54a52601ca437c5f2802b03181d18fc24da86b9b791e109145159e87431cfc262090c3bf831206855f661a0'
        'd41e32abc7299b1f9b683098271215290c257ced53feedb77909c5377832c5fe60d85863ca16981abda61a60e296dec6766172cc10a11fedcd8dfe5a900c7d37')
build() {
    local files=$(sed -n -re "s/^[FL]...[[:space:]]+([a-f0-9]+)[[:space:]]+$_clear_version[[:space:]]+\/usr\/lib\/(modules.*build.*)$/\1 \2/p" Manifest.linux-dev.${_clear_version})
    local config=$(sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+$_clear_version[[:space:]]+\/usr\/lib\/kernel\/config.*$/\1/p" Manifest.linux-dev.${_clear_version})
    local map=$(sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+$_clear_version[[:space:]]+\/usr\/lib\/kernel\/System.map.*$/\1/p" Manifest.linux-dev.${_clear_version})

    is_path=0
    filename=''
    for line in $files; do
        if [ $is_path = 0 ]; then
            filename=$line
        else
            mkdir -p $line
            rmdir $line
            cp -P staged/$filename $line
        fi
        is_path=$(($is_path ^ 1))
    done

    mv $config modules/$_kernel_version/build/.config

    mv staged/${map} modules/$_kernel_version/build/System.map
}
package() {
    mkdir -p $pkgdir/usr/lib
    cp -Pr modules $pkgdir/usr/lib
}
b2sums=('81c21018845b0b147629e604783834397cebe03951c908ef0cdd9848ab85497e2af44af9c8af7d0f671ae7a989c39a1f69beecec990d2aa35f58dccccede4965'
        'fa31dfcbc066c845344002b65d09a4ede7c138bdd9efc5d56d634ba3a123e8a95d966bf190f3f9e354dc9f1127048b1a59df0729f56020be42e828a145f6a86c'
        '75993e378b6f46f7b8797e53053af0c94adf0ae9ae6556d4f6daec3a2fd76334eba0c42d3351d85d5a5c2b3e5c91223d5c8a951450f74903ba2dc59a8e81a53d')
b2sums=('497fe4f94955988cfcd566ff2b00770370120aa42e387d08eb15cbe86e4446e386c7bbd2f9e29957730db63669d066638b2742ecb48f1a34d6f9b77298cdc823'
        '015ecb28a8e8c835143c3e8ee69c1e1d3c73c63782e4047ec2cb0328b07b7a069b341c97c155a80a04352f730d7efda523aca9fb7ced0241ec7c90a120ab5e15'
        '02ca1844d54c6738cc7b3df88a5ff9f111f9bdebe63d64adcf8c6c395f1bd4d96c4436543c676c910fe9621c1ae5915a412e97c45b3d3add98b996526087c858')
b2sums=('8e16415c713d7435152abb98b340b97d0e56cf4c0fb4404f9e606187f3bdf5fc095f55aa8d4d3f712c2dfa3665fadf8166a23b7b61797c255fccfe978b1853d8'
        '6ce438e1d5d8eec9ab5fe514546338667eb0e2abc9af4d671b24c9c1eda5d0a02d9e6891d97bf8f4409751ec5bff9a0eb46710ac96dfd127a223b3a93aecedc0'
        '64ae29079aaa14543a1ffc9fdc214e034da6194715a31e910a0ad20faebd517cd8f3c9cb0f37326e5ed841a59ea036bd43ecdcf78a1a7b22dcaf3368664d7624')
b2sums=('897982c2f76a4f2a6b9a51428d534b74d1419310cd85dbd2ffcb95eeabf8c301aa3b22bda9a425fedcc6514f6e86e956e9aa46e7680c81875c122ea431f575ec'
        '550d97b13b2b600206b53798a172d532637b401cc7a20b2c58263132838a863aa00cd20c487df9b35adbadc2c0e7f1546285c8a761c26060b16c68e684997e0a'
        '9758bec1321608934e921c96f2b7c47509e0822951e2e188bda5ffbb5aed6b0b62ded0825d7c5330fedf7200afdb7ac355e82fa72ef3202404e217da8f645703')
b2sums=('0e2ada54d6dc6b40a58979cc756a223ab125aaaa7d0009aec0523934ed9611732b179f4291cd0fcdf0067f08142caf0c39e8aae56c3998fc5bf5ce2041c1f4f3'
        'a38c978f5852245d25978b562aa3b1aec76fc2d9ba84cfbdd569970787def9f483b8ec60f2db3fdccd9c68cc8c24202cc7ad0cc65eb72b982b1ca4946b584f76'
        '130c8882614ef8a896d3963687cc00f3a0e5b6545bad23dd69e418e2e2d007335eae86e85a28f47d8f2a351a651873dccd1e1e1306c4850948ae4bdf2ae96d0a')
b2sums=('609b665efbd3d6ef5b803854a008612766a30a6c0270281fb1359dc71ab127b14dd39245d6ce3773354386e21f2b4b38419f7d1ae873f3b7663d510cd94d50a3'
        'b4bfbf21d840b983b761a8443fc32cffdaba722632602c25c1d63b0a08ffd5023ece5b039862e9d5e3c9b6f5923c4b45507f6885bced1ac3090cd60a87a9c71c'
        '102add95d577ab5954483174f11f3ca047697d510d0566c9c3319238bd3035a7477039175691d17a1af3f4fece40601396c75a853fbec923704427a4c16db866')
b2sums=('4dc3439633c0454cf8aef40350fbd80ec6db13474e440d8588f925dc6ece9929d94034ec62855cd544ace1ddfd7863911514aba7174ca84c963cd6adc6d36a18'
        'b63717a132d172b271ab4bd8181513793cc654d66116211849cdaee1caa4e45864511109c75fa9d988a00c91beddc28d04b7f7bbe34aaabdfc062b6c14b00f0b'
        '37a9b07b7683a9a7f66222617e668eb2f200698081ce27b7d08da5c8180cb87587371fd3e30847b080de7a1228c96c9a1ef8e90dfa0e938134d21177bc8692b5')
b2sums=('1c1dbbcfcfc8614eb3ac4ba3a22ce5d479378c82cb87b3c70353311bc1d98fae8ae0281c5795c6d3faf8e4051bf39e9776ef45bcdf45bcb7a75926f15bdbf699'
        '85261238e652e9869683cd9559f3274ac2cb0c9d3fde9da00bd0354938fefdac22985843b0c6de0aefb2e553a59e455328bbf765fb4ed98bbd62596e1bfdb137'
        '3719c4164553c16f04ec02d86699240f701cf14a0c2de5d147aa108eb9e709d9ece38b4e27f857012a814639338adf83f8ecc7f0ca2e7847f48b2e9082aa7cf0')
b2sums=('4992da2ad20b99697f17eea0461da975df2a82b98ff03c007a9527f65ea7cf40f15233352b8430006fa9e084e8717b96daf83198f5530a9cb6ffa91e52eebc86'
        '75880ab2d52d1544834c5cd6b2656b2c3c4739cdb3d46c5254c3e56b2595ef7e730a8a8ac48609777838b5de36b4d87dac8c5e8a6b8abcf74db84a66164bafa5'
        '06b4ff5a559dc184aeb744211017bdc13eff410a21572557a45acf6ed16f1b30aef46bf08d3b3f47ae2ba5802983ca1d9da0db3b597ac56d7ae93c1f54e3635a')
b2sums=('e9d3f131fb899a8e5d064b07881434246623d9a7bd018aa0f0e0e7fc9b533d271fa8f60fa5743d21b8d550bcf804c7c6b1906e75ade34659f7171b21643dc953'
        'b0153d5f25bc386d230d40717bb5e96e49591911da68aaedc98a802de47d6e27ddde6eb08e08b2c9580b2530119027dd67d4e0d967566f3dd75ab90c3c031000'
        '402ba6466ccaa0a06cba93c1aa43136ccc8705a4c578b09c8e9801e2117116cacefbecfe71eb9126a63cbe62142299a543b51cfaacb972fc5b668cfbb0c12e32')
b2sums=('f07f28a579cd7e0ece8cf60c39415941c166fc5599a407051085f228b1597608366c6414e764407e2a6f151b0c91593ec83fdd36653a4af1ecdb974d1d4b2a8a'
        '78141668b016262c174c012bad563f0264ea8415afb1313272bd44ef34f2171ee088c5e7f83ee8358da5498fa7c10e534b29cb482082889d8242a73ad1bd0a60'
        '5a783e182f1dd4aa742387cc98d664a7ee1240ebe1fd0cc977a38e2f800144ce80cc5976ca6247e32aaa0ded19893c03204429130e6af39b9e0fedf69b9e02d6')
b2sums=('bc0a80c91535d31719a13c78820afefa309b4bd481b3cdf1576dce2b93d57efce556aa0225ebfb61e0d598ca6c8ac42b4645b9f4592e586239b618a682b5c328'
        '65e9bc0779e8df44373504b8ff1b182a5a1a895891e9dd5ab9f9fe57bf37f0163ca582a7fbe064532c2f83c1b85a53b696459a706d9cc17806c4db4587683d2e'
        'b7ccf0d59f36480bef2381eaaa3da196c3a6556f460c2b94aadad6692d4a0b95c1618c1bc780ba5b5ad5ff7f9ee7f63fcf65cad62f4ef094b8fdd7be7e5a0499')
b2sums=('17aeef4d3c3c63fc3ef7b4bd32dec9883986275ce7906cb01c3e1a3c8d62730c35f118551e6081aa1323eab16856c78e22f3e74995ca5b703b444a629d6c68f0'
        'df0cfb7d45c73a85d5007ff25bf897f13b89a0249fd7a29bed82a5e90a903f0a3e052d11e09cf8f103ce85e8d8d91bdbe6cfccd636b11d8124796fb2bf892050'
        '6b25abb38e1952a6c053fdfa84f0a2ec43dbbe2f25f69cab508c02cf16d8f6c2ec779fac8d71fd346bf38b37c3898224868bdb5425f76b3f867085b69578fd02')
