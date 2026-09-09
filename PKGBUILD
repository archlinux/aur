# Maintainer: RubenKelevra
# Contributor: jprt
# Contributor: Zepman <the_zep_man@hotmail.com>
# Contributor: Michael Lass <bevan@bi-co.net>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: reflexing <reflexing@reflexing.ru>

# BUILD INSTRUCTIONS:
# -------------------
#
# Please note that the usage of Microsoft fonts outside the Windows system is prohibited
# by EULA (although in certain countries, EULA is invalid).
# Please consult the Microsoft license before using fonts.
#
# This PKGBUILD retrieves only the required data from the Windows 10 Enterprise evaluation
# ISO. udf-http-range-proxy parses the ISO's UDF metadata via HTTP range requests and
# exposes sources/install.wim as a virtual range-capable file. rclone mounts
# that localhost endpoint through FUSE so 7-Zip can seek directly to the WIM resources
# containing the fonts, without downloading the full ISO or creating loop devices.
#
# If the range-based path is unavailable, the build falls back to downloading the complete
# ISO. That fallback requires roughly 8 GiB of temporary free disk space.
#
# The rclone mount and helper process are cleaned up automatically on both success and
# failure. Extracted fonts and the Microsoft license are verified in prepare().
#
# The complete ISO is also available from:
#
#       https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise
#
# This package is based on ttf-ms-win10. Use that package if font files from a local
# source need to be used.
#
# ttf-ms-win10 is considered to be upstream for this package, which is why its
# maintainers and contributors are added as contributors to this package.
# Without their effort, this package would not exist or be updated.
#

pkgbase='ttf-ms-win10-auto'
pkgname=(
	"${pkgbase}"
	"${pkgbase}-japanese"
	"${pkgbase}-korean"
	"${pkgbase}-sea"
	"${pkgbase}-thai"
	"${pkgbase}-zh_cn"
	"${pkgbase}-zh_tw"
	"${pkgbase}-other"
)
pkgver='10.0.19042.789'
pkgrel=7
arch=('any')
url='https://learn.microsoft.com/en-us/typography/fonts/windows_10_font_list'
license=('LicenseRef-Microsoft-Windows-10-EULA')
provides=(
	'ttf-font'
	"ttf-ms-win10=${pkgver}"
)
conflicts=(
	'ttf-vista-fonts'
	'ttf-ms-win11-auto'
	'ttf-ms-win11'
)
makedepends=(
	'7zip'
	'fuse3'
	'rclone'
	'udf-http-range-proxy>=1.0'
	'udf-http-range-proxy<2.0'
	'wget'
)

# URL of ISO file from which to extract the fonts.
_iso='https://software-static.download.prss.microsoft.com/pr/download/19042.631.201119-0144.20h2_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso'

_ttf_ms_win10=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
arial.ttf      arialbd.ttf    ariali.ttf     arialbi.ttf    # Arial
ariblk.ttf                                                  # Arial Black
bahnschrift.ttf                                             # Bahnschrift
calibri.ttf    calibrib.ttf   calibrii.ttf   calibriz.ttf   # Calibri
calibril.ttf                  calibrili.ttf                 # Calibri Light
cambria.ttc    cambriab.ttf   cambriai.ttf   cambriaz.ttf   # Cambria
Candara.ttf    Candarab.ttf   Candarai.ttf   Candaraz.ttf   # Candara
Candaral.ttf                  Candarali.ttf                 # Candara Light
comic.ttf      comicbd.ttf    comici.ttf     comicz.ttf     # Comic Sans MS
consola.ttf    consolab.ttf   consolai.ttf   consolaz.ttf   # Consolas
constan.ttf    constanb.ttf   constani.ttf   constanz.ttf   # Constantia
cour.ttf       courbd.ttf     couri.ttf      courbi.ttf     # Courier New
corbel.ttf     corbelb.ttf    corbeli.ttf    corbelz.ttf    # Corbel
corbell.ttf                   corbelli.ttf                  # Corbel Light
framd.ttf                     framdit.ttf                   # Franklin Gothic Medium
Gabriola.ttf                                                # Gabriola
georgia.ttf    georgiab.ttf   georgiai.ttf   georgiaz.ttf   # Georgia
#holomdl2.ttf                                                # HoloLens MDL2 Assets
impact.ttf                                                  # Impact
Inkfree.ttf                                                 # Ink Free
lucon.ttf                                                   # Lucida Console
l_10646.ttf                                                 # Lucida Sans Unicode
marlett.ttf                                                 # Marlett
micross.ttf                                                 # Microsoft Sans Serifc
pala.ttf       palab.ttf      palai.ttf      palabi.ttf     # Palatino Linotype
segoepr.ttf    segoeprb.ttf                                 # Segoe Print
segoesc.ttf    segoescb.ttf                                 # Segoe Script
segmdl2.ttf                                                 # Segoe MDL2 Assets
segoeui.ttf    segoeuib.ttf   segoeuii.ttf   segoeuiz.ttf   # Segoe UI
seguibl.ttf                   seguibli.ttf                  # Segoe UI Black
seguiemj.ttf                                                # Segoe UI Emoji
seguihis.ttf                                                # Segoe UI Historic
segoeuil.ttf                  seguili.ttf                   # Segoe UI Light
seguisb.ttf                   seguisbi.ttf                  # Segoe UI Semibold
segoeuisl.ttf                 seguisli.ttf                  # Segoe UI Semilight
seguisym.ttf                                                # Segoe UI Symbol
Sitka.ttc      SitkaB.ttc     SitkaI.ttc     SitkaZ.ttc     # Sitka
sylfaen.ttf                                                 # Sylfaen
symbol.ttf                                                  # Symbol
tahoma.ttf     tahomabd.ttf                                 # Tahoma
times.ttf      timesbd.ttf    timesi.ttf     timesbi.ttf    # Times New Roman
trebuc.ttf     trebucbd.ttf   trebucit.ttf   trebucbi.ttf   # Trebuchet MS
verdana.ttf    verdanab.ttf   verdanai.ttf   verdanaz.ttf   # Verdana
webdings.ttf                                                # Webdings
wingding.ttf                                                # Wingdings
)

_ttf_ms_win10_japanese=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
msgothic.ttc                                                # MS Gothic
YuGothR.ttc   YuGothB.ttc                                   # Yu Gothic
YuGothM.ttc                                                 # Yu Gothic Medium
YuGothL.ttc                                                 # Yu Gothic Light
)

_ttf_ms_win10_korean=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
malgun.ttf     malgunbd.ttf                                 # Malgun Gothic
malgunsl.ttf                                                # Malgun Gothic Semilight
)

_ttf_ms_win10_sea=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
javatext.ttf                                                # Javanese Text
himalaya.ttf                                                # Microsoft Himalaya
ntailu.ttf     ntailub.ttf                                  # Microsoft New Tai Lue
phagspa.ttf    phagspab.ttf                                 # Microsoft PhagsPa
taile.ttf      taileb.ttf                                   # Microsoft Tai Le
msyi.ttf                                                    # Microsoft Yi Baiti
monbaiti.ttf                                                # Mongolian Baiti
mmrtext.ttf    mmrtextb.ttf                                 # Myanmar Text
Nirmala.ttf    NirmalaB.ttf                                 # Nirmala UI
NirmalaS.ttf                                                # Nirmala UI Semilight
)

_ttf_ms_win10_thai=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
LeelawUI.ttf   LeelaUIb.ttf                                 # Leelawadee UI
LeelUIsl.ttf                                                # Leelawadee UI Semilight
)

_ttf_ms_win10_zh_cn=( # Chinese (Simplified)
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
simsun.ttc                                                  # NSimSun
simsunb.ttf                                                 # SimSun-ExtB
msyh.ttc       msyhbd.ttc                                   # Microsoft YaHei
msyhl.ttc                                                   # Microsoft YaHei Light
)

_ttf_ms_win10_zh_tw=( # Chinese (Traditional)
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
msjh.ttc       msjhbd.ttc                                   # Microsoft JhengHei
msjhl.ttc                                                   # Microsoft JhengHei Light
mingliub.ttc                                                # MingLiU_HKSCS-ExtB
)

_ttf_ms_win10_other=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
ebrima.ttf     ebrimabd.ttf                                 # Ebrima
gadugi.ttf     gadugib.ttf                                  # Gadugi
mvboli.ttf                                                  # MV Boli
)

DLAGENTS=(
	'https::/usr/bin/bash -c :>"$0" %o %u'
	'file::/usr/bin/bash -c :>"$0" %o %u'
)

source=(
	"${_iso}"
	"${_ttf_ms_win10[@]/#/file://}"
	"${_ttf_ms_win10_japanese[@]/#/file://}"
	"${_ttf_ms_win10_korean[@]/#/file://}"
	"${_ttf_ms_win10_sea[@]/#/file://}"
	"${_ttf_ms_win10_thai[@]/#/file://}"
	"${_ttf_ms_win10_zh_cn[@]/#/file://}"
	"${_ttf_ms_win10_zh_tw[@]/#/file://}"
	"${_ttf_ms_win10_other[@]/#/file://}"
	'file://license.rtf'
)

_total_sources=$((
	1
	+ ${#_ttf_ms_win10[@]}
	+ ${#_ttf_ms_win10_japanese[@]}
	+ ${#_ttf_ms_win10_korean[@]}
	+ ${#_ttf_ms_win10_sea[@]}
	+ ${#_ttf_ms_win10_thai[@]}
	+ ${#_ttf_ms_win10_zh_cn[@]}
	+ ${#_ttf_ms_win10_zh_tw[@]}
	+ ${#_ttf_ms_win10_other[@]}
	+ 1
))
b2sums=()
for ((_source_index = 0; _source_index < _total_sources; _source_index++)); do
	b2sums+=('SKIP')
done
unset _source_index _total_sources

_b2sums=(
	'ef04f4720aeabd313f35056de3fde26c3083c354bd2f3effab9d620233b2fad521dd0f26482e3fe2830446170431e54e0d59872d399d16c4fe39cdb3b50b62d7'
	'1277bb6ab32322b644c892eabb547b65f681128be3264dd6e7160db0f9f3205303ca678dfa4cf19ce54fcd0626d5056b75c86d8226f0849c45cb5781f7c2b94e'
	'0f453daaeae792ec5e28f03d2cf33a995bfe61329627837c8232d8f0e43996427499e9d2f4e4958b794e9099648d9c836368463eeff98f187bc6c668ed822063'
	'd8eeed3eb3839812e781152345d5b8afcfbb8c07c24d24851c2f240abe0e453aaae1c78c5cf3b20119d44ced149372f94b478a8b7faf6112d4e5ec4196704dbe'
	'e1f57e1d2ad9bc100216e71ec88828a3d1ded3d17ef38c32293ab64c54a41f9d0a6e905e3a62ae9cd2d8719cb74f096b8d0a6267d8ebcdf254ab74e3e013a84b'
	'8aa509e3507686ad88e91d63cb8938057aa0f09bd89dc94fa1eecb20a7da8aef0400743f78cfbcebe8bb9e008b3a5fd19c3c857f4929d04742e466f6d6cdc52d'
	'1dfac8128964d9dbecad60d2184769a90f43b47ca1e3a894444a301341c833aaf6ae159e18426f0f631d93fbdecc5f8599937c86cddf43f85d541abfeb54c57b'
	'543e834bfff0f91293dad9b11e0368a4cf20a1b75dcfd7e7138cd5b6941a4418dd98cf674cc286324b3e47fce6d1a9100ed5590ea80f3eebbdeac5ddeb14a4ce'
	'0314d618b4962967414db4fec7a1c4f617e87415b87332c08a3fe94b60b007d187902e253b991e71caaa0ae3faa402e0d228d0099460613833c898fd2624c9ac'
	'7c65c062ad0ca4b6e437c10857c762def9594fec7de9dc399032b54d63fba47a43d19b3a9588d44bb0a4593688250319d0746a166270f8d89f84347143bd8bd2'
	'9c914578de99e44f73d263a9fee4bf44540ed9bb92e97930f8d9f0947ed99e4cd288a8c214fa60001dae89727448174872067a5dc89d23f26153dc3693ee9cc7'
	'efbe8f2fddb96b467d38301c83dc66f9cb6d8944ddfcfc256a91526cb7c46c546a7e71454f8dc5d796e87fcbced2563859e8e932e466744278ddaf11778b0768'
	'a58e1b271f5b3c03e3718e4fca17d0f1369f629805a8fd5866b4b4d2cbc6f1380e74c96f90aee567708b5cd00290806ff600a1ff712a0bd5db6d86613d98110c'
	'fea45862b877eca55a12ed1c3655f0d2d82dad55aa76b07cf753380038ae97db734743d0553853f58e35119e68ad0042608ba6154772ee0ad9926454b24d18b6'
	'051fe261dee1e6bc642d5ac2718003281a312a470cc5c89097a661d06636086e73778c87d5b6353f9e5eb276fadd4e058e6a7688ab576dc881a15ddcd7d46ae5'
	'989eb660bf6cb54d2ab0213c310410d311a2d9bb1c886b34609b04a3e528953429aa3d94985bbb13b8ad7c71317fda01781d2d70254f543435f49faa536b8229'
	'cd67fec3274669369822f55de5022b6f3cccfbfb98de212fd69f0f5f7bcc4434ba6ae813d86ec6fb192bdfb18dafcec77e50e71bb30280d2d44bdd5951600c11'
	'55bf9a577b07dac7040f19eb355ee8a394180958d02fb400a71d169e30c84f7753726e3428748185d3ec9aa294ee46ad230ae6061f6c6d782c931d1fc8c4fc95'
	'4903056e4c1fa05a853c4d6f8afd9088e056b52cb6dd9b760299d78f573a5e69008bb3a342a5d7f44099cd9615de1ff5bf90a3f0694124eedde4baf42467c8b1'
	'c31cc7125e12345e119592e9397af7fdc46a6e56ac50ae866b1edecf504a111c93a3c6929fd9ec3604d616f3042c35df628651c00f669b565133d0233b1f995a'
	'c346254707481e608b69e734bc3f1207a74bb3805def11854e6451c0142d44d92f4d0e6943f564e7a091160b92fa672586e660353b4e68001184e790246a56a2'
	'b82322a89b99a72e4d2a7d45d271ed8508dfb5507603d0bfff31d281885473401283080509137bc1d10f61132c45d33a18151642da0ecce3d3d7783b0726b5b3'
	'0ce224d5f724a8330588cc2f7c73ac51c171a8635b59cb5bc1403880cbe2cadcb14e9554fa468b3508d971b9aa8a1319dc1a709c78954a2c8eef0c25867550d3'
	'1b8a0c7b2f3438ae497aadd3b586964335aeb7edcfb0f151b7c08dca6ed35496d0873a9b6d4dc10fa3c265f008748a58427326db3694462101736484bb38fc4d'
	'73d0f7e230d3874efd8f4699f24bb73aae7e6aefcb5f87ca3e3b75a80f3be9158b895d7f91bdd69c3f245cb81075149f04d45989b4c6e50afca019fda2b6feac'
	'f6f2bdfa0124d0dea6785903a029e625cb9a052f69efc0a196df9b5714299ee3ec519a4a5d77fc9a51791cea4e148b0c231c0778b2e72f9d72efe57167bcbd53'
	'b8cab980b49436caa25abdfa33d7fcf70eca3127cda81cc35f8cab96febe2dfe53f43ba1512465bab6041d3240158ce2f7b1b3f44a48053f889118f5cc7871d7'
	'5cb4f92a5170383aa9cb42fb163df10a7c5594f2e0a55e3a10386ea06857f1291d74a03e5e38799586fa126cc82ab10e7c467b9b456447d80500624e4e2355f7'
	'c7ce2e7b77045bfbf1b118d9e7b66ba7d5569ea3eb00385385e30e417fbd8740ef2e659b9ea5df9166c89ad845facd8dc647e12de61a754606b445a5cb0df65c'
	'657248102c77cae0977146434644ca68eca31dc8e8613a12f479af31226c7d1e136067c538e82e0f4b6854c2de3ae49210ce8b768afe638bea5d94913ef737e2'
	'e2d105563235d23292752173d9fdbeb882bb149c78b078de0203ac7fa288ab3941c5f0056fc02c84834f5b13f020dcdcdf46518288a4874f6159935d6c2d5bd8'
	'c3feeaea47c57475ad18face58121beb267d707d60e25588796774607f16c212ea8cb55d590e93e607bea1835b849f658a32cd3ab43947c12347bff9445e147e'
	'001b2fd9b2ffd1096fba649228b7fce62c9f20addc39a4bb0ece4f1c4ba4739d8c1b6c135324180d2739473f4c281c54b8b5876b04fb0f5ce9070bd71abbb835'
	'23a6f596404f9cf2b28910279cb7dfe7d3fca8c72492fe055b669d2efc7228d7568cdb70fc9c444b2bd6e18d8c9cb846dfe30ecaab9d064b0cfe52d8e440d0f0'
	'ec80b99bee891a525e27aa749b4426a7076c4d4750ba6cdf968471e5756ab83984d56f41e2bbd0998a96674f008373f92eda650563210edfd6e5b70d3029d973'
	'9f191532dadcb4a8da4b9903f182251bf2b208d28952fdb870762ca73ec6dac6836a179d518bff3fe8f09d5c1a3fb02973e752b3251241a07e36c9916a2d8445'
	'168874c201e20116ff6f5388122585ba8a487210e111cd9ae1f089070744d0ba3900d39ddd54810a36a473dddf6c76b7cc1c52bdb6eaa62b8cd9e5ca5e758ecc'
	'002c328a37f26d8d8158514d85d6d7f2873ec7138d907ff32b30e69013c416faa1cddb6526c61e14a37281f7d1a07dd3bac6250e1334c0b44e9e3e58e0885205'
	'b02ee0d840cc0696a7b28bc7b2f45170588b0c163823b0794722472d79c6af02101584dd46f045b63a0691435b9ebb16367f51a7bbb06ead5773155347421008'
	'6e456d62662ec5e5ff94c9f2a7a763db368303a40aec9b095c175bc9943e4b992fc64174336fc3c78ed095b9d736d5347099c2123b2515ddf403f67936facefc'
	'f254687c4e8464df89110d772fd0321c9268a75c7808f780ad74de188f9731dc367b64123c956fed740907727050f4def9abe6685f04cf95a03e8ff446d8aae5'
	'429aa00ad814808bfae82d6680fce91142ee5ba5faa47bebeb518c53d01503e8c60cd58379d32b0c5aa20292840702910c9a112de3d8e696511446b0b7bf034c'
	'07cf4dc34b3ab7fa63ae3bc24a5e7763769916efc91d31d4d357950e720267cceae92e41788246d2dd4c9d524cd32f1c9ffa4a461addaf305eee72567b214cba'
	'033a3c807b6c019f189202183a234feac1fe4dde133f1932a41f1fce00475dda44c527463ca0c9be980a561829ca0bfa20e8752d32ef0abe08b9d46ef6b5530f'
	'656b247c37d946d880ce1a43c2119189b414852e8cb6860adcae5fa20fc2b1a724912b0f3b2d6f75c9f17981863f1e067e4cefa9ff85aa1b1459dde1e027ba53'
	'af97d1bdfcb7a34eb9e10c98bbf7f780239f5b36654fbf40b90ad82febe8dee2e0a8d0da877f38db0c00ec1bf3e056d9007ac0674ebc63c34f094dc87b2852f5'
	'98b9d049326e8480c754aa64edc094952628ab6f1929ae3c5f6ba280c112bb4a7f7c751490b7a95f0e388c33ffecb364c07436b1478fdbe5bf5579640f953ec9'
	'defb8a9409bb37c7a0c4edaad17e63fc7d0c2a114555469cc9bbd1c686435c70df5f32e9f61c42a73e88b732d398a4b181d1b39717212047917d66040b739ec6'
	'9a7ecbd5e702ed71553c10c05c88aa5ff7e3d63dad51774063396d0588968a882fbf80ed37dbe098f562c4c053472e0eff67b0bef05713586d6137b96714ca7f'
	'fa0f4a39e5ff22e4e7f5a476d601c391a97ed68d3de3f95e3a7fbdfc887c99252208f34368d951a2e5f075c6096c7bad63186688ea96f5235eed0cb363abde59'
	'0f3bb8c17641aeff98757afbe808478a3d45d77a05ae338f4a7c926078372de318f0e3110959689b2537abce6babaa00defff78dfa6dc0513c5649c7b56ed29a'
	'877c47737563604f2d92ec30d48582ae6f352530b171fdb82cf69ad76b29bb068ab64d1cc2e9066b6933264245951b88a3177bc73115116630ba48be293d6b16'
	'b1a807edfd82ba8c487c64cf51d1e9a0343c526ba14c7d52e7cdadcd91096b0e33b985e57eb8a53c7a6f104e4fdbbe9bcea4d2f4fc62abdde096c90c01507070'
	'f4efb763e4e488d5ecd7a296e2294dddd88f03e90efeb6629c0b0ed2833cdc5f26d7ebf61bf1f070f5c4d992553ded538e6a62a324bb99af6d008cb97dfa691e'
	'4e07f71ff5d10ac1b85ca1a3a7009d3b38525e62c3dbee7fad11627f60bff43d41a8bc73dcdbd09f8aa67e178f0be4c42e834f59a9ce1590c3305f5cdcecc288'
	'7fd9aa00bf16e84e73b15a86326b2e96f94555097dd36542417eacc58cb83bfc6bdea212ac13b618b71c4e9a04d9afac0435a1996b855ce9529539172fe10971'
	'9c50fed6ca0c00282e05da09b10a16217b62e2275d6e93a0939d35e2c1c7d770fdd8490f294a1bb926676807047bac3b74ae73704e22eb1090c13d801040947a'
	'ca94220e5810c676921ed19bb1df438b6987c5a61f141b8f5e4b39e5a9ca73a716f7ad0bf976a431fa4817dbc98f05acc7c4f432e6a1c063f0e22bd0acecce3d'
	'acf04d6aef0326e81e2e36c7d93ee33f2aeebbd2049d1ad01a75293e14d3f368e2dd67e53044b876d14a7726cf853175dfd4cf0e721c9b940458a3e82bd3a85d'
	'9eb1cfe0156383b6648ab82235e312e2dd3ca2c926c9f697807f56c5b6ed8a8759f275b743f91f90ffd84adf0a8c152fafb2405dd0a71e48df0c770eaf2acd35'
	'1f194457b29f355d3260bda30a5da96b73295ac2246646596aec2d511d6bd5b81546f719c46a6d9c4380cd699afbd3366dcecd707981d335c39e6051b460db29'
	'37d608aaec015ff8cfff079ffc652ed549dce00e389dddd2c670a6e09adf71d4343a7e8bb1dad5b147e71efc3441d1adc75bf3c150901e8b44ad41119b181c32'
	'4e8747883302056668ccced0ab493e68f114bfee2a5f1a0341523e4dc7e621e325d6a48bc6c57c22989600a0bc9e5643716f381a594a8c16f61eaf241eaee81f'
	'35b0a01133589976815da0c7df9dafa1e824272f297914a8313bac02852f33d8676598eec7514a841972fa2b9797cbddec575a4de4a249def2841edbc6dac145'
	'4af552a16f4479e48575935d4cd7cf0bd7648717ca00b7dcf29fcf7141246eefcc5643b824c2a16baaa44df830d1531cb0e5a4082ee823d63ca3e3aceb99a0cc'
	'1601a675aacecccd429f4dc08fc74217f40594fbfc4543e997841afd812c555d8b806d035f93a7e53a7a404d376b4b9815447d9eb4bb4b93d68b2d48a416f3fe'
	'bab69db6608b2ed7bced569420dc6981d86bf232304779c4bce7fa1daef65588aa5f6f9cd6823f2ca28291d0dd9a0248f0d5f700f3820b57e5668eb43ab8d74a'
	'5e3d12bec6ccba351f0549ddabfb234dd6cf3c69225a9db7098f88cf7e51d94ff8920cfb5659e09bf9b2d320d1083d18c1d0be7611ce95caa68de8e06317515c'
	'841f0897c2e3882da38f33902b5fb5a94d5bbfe842d5d75953279bffe5bf0fe7e2da2e61df5d73784a0b556e17cc001ec2404cd1f097c38b7eb08295bbba39ae'
	'7c4c26e151c424fb0f65a8ff54f65746145e1867da336072da5b29d4abae6295a0406aaa24d7aabe942d5d50dd3f56fb48631197e5a30b2a33dc855e007b7a12'
	'c1323c6c994a9b195824e44cc46b6ce583f0e8e943ddbe3738f6e4ff3e5fb2d19403049bb907570132fde49127e983e2a97c0b5beec83e3682e6b42fb066417e'
	'7cdb7021b4607918b47c3c8138a49d3363d8fb8f637ec48720a5af1db2aaafc6d2e39f2f3e34e2966f2b7642e9bfe83c31af837f9724197780cca55af02cb3cd'
	'bcea1902450779520f07e4e0fa38647b9454ffed791dd4eeacb3b4399e6dea665bb1bb6f851d187d7b1422a290a50af9783b7783ee3a6d4ab5f749513ccaa9e8'
	'ff87eff8e051c6c32989745d3e8de781762573509ec1165a7de1b1846b0932140f8b1219ea18d0da1b2d1907c1fe11095e0c354d9bb3e0f3affb4ad9ad400e84'
	'536895959c62ba71742e7837be26bb9f5c3239e961a6a6953f1e411ef66d7f840fb48a8d82edbc68b19a2353e9a5090d69dbb54eec62f3c25835e48c95c26fe7'
	'bf4d722e84493b66a824245ab4b8af949b70a491a583095c080fe1e41131e87cdc8acafbdf24ea131a9aa378922a349a641378bb12faf57cef188ee940fba5a4'
	'2e2f0881765d0aa8db3a1f55cbdd893e4d3a97f30f04757d15356586c1e5d55ea2bc114012d1d0e87488d6af51f8d3ea516be0fc11600edf274ece79448794b5'
	'2af62ddc83fb6050e70f1232644ecfc63b1414563f5c972b9ac53a449c692d606dd2664db6ed7da31fa3d265fe8da290ca60c111d0153f6847bb6f4277eb4f05'
	'd6bf69ef81cf535fa955b52ea742cf39a1d3270ae0c5525565bda6f69aa2b78f6d5958e8c4c7f01113847b2d80092edfaae13bf349b51f27c51b781492d2e5fb'
	'4195a83287f0065edd90790be058aeaf00d869618aba141eaa2c22496b4f6ebb4d47cc061132cf11e900eb6dd296afcbfd07ea03260a3fa1feefc8479b9285d8'
	'cc0e784d33060571776b37f93128b34d4181cb1f5c56a979acd136323e11aeba80fb01432728b910d8b5bc006b97ab380346fd4e130519ec048e3a2209cd10bf'
	'92d78b540e4778fce92b9475519c1483a9481371b3e8a966e51cb90498c3fa83821c8d2d6d4f4f235c54cb718b1cb99e450119a4e04d9f9e3e4df5f9f24b118b'
	'c236e32c2d54b853df2f47e076722fe020693885f641fbce6d1b8ece3bfa37bcd0e43967e605b04a52b7a203f2b48b140f0adc865067325c35fa3c1ac362e5dd'
	'ed432d2ae0292a4c5fa6d7e18b3930c82741446c7c90b61265497fb1265cde33af08aef0bbc1946b63747cbef0db137495d01f2ce015b3281d19d828c2cae0a3'
	'1501992b507c5abe70420be87e45ed63a82eaed965a7791b79322307637bac2346b920ec157184ef9d25e0622b24d93946363f9dd7adf3073a948ba9b84739c8'
	'00b5a4b2afe05e17b8d667b55726a5d59ab009d23f569bdda379e7b4528914db61e3f5ce6dd0e06647181ef263f27800ce90ab625b0c7b09abe56603f10d2a36'
	'b09cf1077cbde2ed726bffd10ce3b518c8e798fc34ba505e588f61ab2decb5c3562e0d08ee51dce8a065336311e60980bb19eeb623b606ed4394770849553cd5'
	'11476ef70caf2f44535825beec41a118833531061aedc38d58c3c04c79f167a9d4adcf7d297bc77d4e8f65f3bc0e33b70a4915168fe73f08c86ab033cdcdb05f'
	'e038d05d917c4a7b234628750c35b953f9de4f85bb5de48aa1026533a98a62e073001312e54ff4a0a9f2844eabcb8891c4b439167d6c3eddf562d66e39f11c43'
	'25f0692d2f6337853ee29f96d5bbcc0ebda9f4b9ce47399338e5f4b95aa1a6db7a6bd19e868a95d5f992e3807465b355bcea5a03ae47f68f3ac8a158aeb8e275'
	'75fd851d4e7a20fc00bdf3a045116c731fa920331c747457bf482ffc5226a2b95b5936720d8668774763d617c5853d4a5b69fd715a6aa13c5345f36b58ec9e87'
	'37785f19248dd80e37450196d9fcea52ab3fa6ef91a51e8ad0443145c8c218e661d28077f5667b6fd504c07da475549f882fe5652b37464478676deadf17842b'
	'277630584141e0b8ee44e4ef0c2c12e29d7507fa85a0ac5b593d72c5f958352270a41443171daaab25b9e1c2e7eeb2c47959785a257cac847261144cd00c99d3'
	'31e1a568c3f74d1590b871691f51d3bbe2f0faff9b2c320ff853b56e1cfdaa455b900d7f24890e45c989d15757c1fd1d2a39d2a92d2e13a85ae73a0671bc7e7e'
	'a8444dfb3a93e9c4fb974fce0fdf9aa8fe4aae0b0789cdeefb56f7f6ae6432fea11348ba7e8d94d9a490e9e77da09b4b5659c0ef858d4e43459fb67ec08436b8'
	'196c08610c60028cd99d57dd8d72b868ac38d6961db4d78e069ec37388356d19992f6aa0438160ea936e0526192e5b45c67eb2da7e737f634155e84331b5f229'
	'24b15db909bd0c9134be897827ba39119b73d8fd1ef534556b5eb4ee4c4a6d0ede5ef38c727fed972696cb5ad524528255cc38b758efb183822924c9441ed358'
	'41bc438b69eeb60b28ccf13851c7ce70b9c12788d851cc849e0d5d572eca0a723a896637c009ccd63da72cbdb5ed1423c023ef4df509b3a31a5bdfc133869f0d'
	'728df7ad307014b3f2628fe9432e94bd260b6ebe22e11143ecc219bbed2c18e422aa24d634c03aaf69dd71a73372ad0a2b1719f130aa622b1479b2bb2f87b43d'
	'fee5f0634b28c50dad5166d07074c5160cd61f76f2910c8147c0504e4fa7ad3e7ffd0bb42ff29bb2ff3da429c30f355b35d85cf0de87262665838c7b22b13261'
	'df1be2d42cbe01cb504be6e4b10245fdcce18c5d588196a088ab9a2b84ed756bf89be3f454a50be7b16210f7b17e1cb8529f36523cc6111205d9cdbf918b7344'
	'7c842921aaa80630d56f63076f1022942e295834804ad88ebbd110d73b2c926ef394b541b16b8b7464023fc0baa901cf31a2a8f3ff6857cb75cf6ac56bf8ff95'
	'3c67b58f85358c9c0635d693e7bacf77aa7a8f89803b62d7bf2f5af7823ccf1ef17db2826bff4295aa4436ae58a25943969570d5a47fdd879556be52263517d7'
	'06b9331e381a32de9a33aa4f4777ba73018d0265907be4e2c16cadd8c959072f4d6f57e9731f8deb1534d4d1c76555b6f75202408ef528d816830335585d25b6'
	'040a12411bcd0ab554fa8a9a8ddbd8bbe2c04cf9028782e63fc64b7405974592688ff0de8d315efda37b121190f39dbb32f5f6045d303683eaca001341761895'
	'48d8fd6312bae698468b6cffb67dd907781f45943edf3b79ed2a963ac07afe46856f0ddb6b931ebe2bc5449641bac724ecec5b031d7da1043125a833a15d3e74'
	'91a4e94e56f92584accdec100a976ab63d562a8f18c765c63482d639d609415e3f25a5410c7ce4e894506cb430de602e9fbb28992236f0d75c158ddd7efd5046'
	'550959e9763f23bced25a1140529f99ba7f1feb57792126dc7be6f2e7409c2b5530c98636360fcd3e1d2338d9e3787affeb24000afdf6e6f8522f0afd248ebd4'
	'2635f90874fd2c2bec60302cd373b26db0e70953b24afd5fa26f0c78eda5e15b039248e149e8788932c7dd9a79aa69d1e41d2a79cb1afad0b4a567949c8d1a8e'
	'fe938863d1ab59d63c92200ff6e22bd9ec73df13ba0c5eaa4f3ec9b17a65fe0fa31180edad420089385ff5e9d49b77fcaca7baaff2bd2848641b135e82d80f35'
	'6c63c75703a3f0c0a38302b604e084d6857408dd0eeab9fbe1195bbed5a00e6504816b96f785a0c0911e616b65aca2d25734b35bbaa6baf82340dba6b5908975'
	'45cd78b64ef3bf24ffccef08d5a903de5012b965b5314ddfc01f318b2c1bdba1eb7ccf841fcedd39085215d0964d64cb2ec90b25059681fa54c048fa3d47f446'
	'90abb162bc7e749d91aa9b9ec473f8ef86de5bbf0872dcb389f80721a1f71cece77c94a631e8f543d92d9e1374042ef61bc7c0dc113cb475bd93e429ba6b815c'
	'2fb0d3499b75c8ce4aed000ccdfe7bf8bce51a0a9499653db3622df50d9b64065df361a3feb1f9fb015e768e5d38f0bdfb46e43287a0360c4988a6d6cdd9b567'
	'2f919ebacbbcc7faeae7ba591f85fbec456fb3ac72c8b3bb27a7b59555fd7b1b98130772019847bbb04f5eca3f50229f685f42fa4e53a69534649016e17d7a2a'
	'db42f3b1d38087c59cee9f12068afece0b04834e379a9085b9231809bdd905a45f792792a47ff042fba183e1ccf984e970f04d16897ec79379d0a3abbe5f4c31'
	'8efe501295620ec48fcc6ffa27f666526698970978293132aea05874cc647921642d36af6f955e357284795b09611d0ddba7f65809195043c275312c59a9b2b4'
	'74429810bf0a20cab3d503d79400ba2804e41f52e1562250a4847112a32ba4bc32079cf6cc62833fdef82e1c6c3f0c291bfa3aec068a608b2d567931d7ce31d0'
	'04aa03129ab3646efb88827c504bdf06f8f21d6a35e8545693e4a385e68ae52e7d7ab83c9ec5726e200ef440f8a3ffe9e088d3a6a333c2e7bb6292f5fdd6f7c7'
	'ce995e768f450ebee46b69799d2c7e80c2d3502ec889d6385a6cdeec213c527d62c8edc601ba105dd32511e4f4059ae378ce9a5264ff68a02b4dca39db7fb3fa'
	'cd8124268ffdeefa0b6593aefa4f909ee2c6784d0a96324ef71ab8e3f5dcf8d9ce139caa454326052ccfc38e436e8c1c3ed0ae7130ae8f4d2c1550289e6d7c5d'
	'e69fb53dd97ecf8c4705845e64ea1bfab8828356cc5708e77ce49b4439f0b72cf4e43d4255a82a7af5ae60da938a6ae36dc72fa2bb81fd38e105812b8e089314'
	'67fa37a1adb5cabc07dcf41c97ae1d58cd0a4fce0891711cb430f9d6d2dbceb0409955ef0dfb17f8198f2a646992a2faeddcffcf690ee1efbd8b93d7d7eef90f'
	'4faea725cec2d86989d02e72afbd17d3d5941e8171e1db9dda94561c3b5baca94af57cd0d60e7b85b667e4d9af74f37d9c31ce6c41ac063d58c08304cd484af0'
	'7bcf3580f63e4a24480b92d2c8d445dd1e1ad85af4d674f548aed3207454d3ab119d298dfaadcf8d5604c600ca205645e6f79254d2453b7085944f30248b2700'
	'd131a59e0bef38be2d4c36439ef0efbee9f02fd6d8921445663b50e95bfd7fdbca5ed573a4104ebfa64629b189d64c71d6737cd711dc2fcc673f22aaf0fe53e6'
	'41663de6382b0bf84edfd278a52d692204be912c43f85716448b22f53693e248c5a16cbd2e236b5aa2be824fff6f1619c0131217b020d2c8522821dd5af768a2'
	'f53ac35b380440679edbab55c5a9fa08a5ba158c17e83632168451d15c2d65f0bb8aa94956e2249f1d3e1e23145aa874a872859765651aedf15b5ae083be908e'
	'46f524de1ac49e1cb2d17a19d48b682e1ab5aa7421e8dc8203caea3ea2720b6adbd9222804d895ee62d869d9b77960d7b66f7ad32baf4f607a27139c1f44b367'
	'a018e11eba89963e9ad934b48bc1ee614dd34edccfe4cd41bf18f331d0c5f3c0ba390633fc036816c109fd63859702b9cf009c82605d1e947fc97352a3491dbe'
	'0903895cf91f0a8a4c8c52397108567aaa3faf3cd9d358d1305b6df600e94190a5b2e3016b60965a0131aeb30dd676b71f5fec8c25d3c58c617059576f919014'
	'e65668d085b7e0ce1aa356432743c919f376b41ef933d7997115a94a76a0629134247a07241d87814d20b4a43b18826139fb43fc51084e0e709eabd8dc9c9d80'
	'0d8207264c74f66221597221b5d48e26d91eac5f9155f0efd58162a0e1758522b8ef79cdd6771c00531a9a2e08a2d70efac88595f54073298d5f328524ae71ca'
	'7d1fb366cc5621ab87cf6e5038c78748ac841e83f07b2286da60b2035417697af7c7afd107134d31a510c362698023336137e718cedbe929da66bf4f02d34d89'
	'259ea5d8d94826610a0318506c108a3a718ed21ebe9b5728532c6ce995ca5c54f9f152d60ffa879295447348cc13f0c2f4337e046893d103231814909ff20556'
	'9c936f62cceb4d0ad06579afc105bd1e6ac2c01b31fe2c7ded52af4ff86207f5e7b314d6bea5cab3a0134bce3ddcb8f93e3c122fd6bd6426fa1999bc5c2d1035'
	'8b79256daf78709b2f47f083b32b68ac1f7280877b13b3efbfcc115d22b537646853a44c800748c17a8fa5a1d9e6daafc9c1dd3b6fb9f9a1e40b5d4b91ac454a'
	'1e103f4fa8f2b8a62dcc3f142296657ef96bcaccf59ad2e38d21120a5e36f19bd5f603e356c85e85d3ef9b6fb5c2b6ebea912b40e572c6ffcf35e962a2d95011'
	'63646a2f7f26bb2081e3fe2b5550049127ebf0941d57e8962b761022505601d46d193a4c43db468792124abccccc4d26f76e420b4e9a863d3243dd8f7f803706'
	'8f5ad8b0f7644daa4e4c9330120409177f25b36a561ab03bac31de5b17d11ff2a35140514bd8ddd63bb412bfe3be43c5964d5d714cd6efbf146d545381ed2855'
	'eeef8f614a7cbdc1a5c6043c0e1fb1951832ec9fd270dda0741a43f436188a049c1fbf8ac7ae2d7666ee3958ca1f7f01e7ca646925c7c45b861f1fad2cd0fbca'
	'2bf1ce2245eded8374a927d44a79977f4787c7c61e58b7a7fd3c79ca152599013d2a155acbf19de1894801534457ed5759c96aff0d8b37da230880a8b6781e7a'
	'01337936f304ab7fd354812d2a19120e7d55f52219de2eeafefa63430e90960fbef1464f9d35f721131f62b8ae208d4b93ccab9e8c3251935ff079186b337483'
	'e4f7c4a9edc25d627cd4c8763e4f50eb48e4ea71c9270951670c7bdfacc29466dea9ff3cee4e78912f744a1ad038a88122378222e1b6ef6152029be663397ff9'
)

_dummy_source_names=(
	"${_iso##*/}"
	"${_ttf_ms_win10[@]}"
	"${_ttf_ms_win10_japanese[@]}"
	"${_ttf_ms_win10_korean[@]}"
	"${_ttf_ms_win10_sea[@]}"
	"${_ttf_ms_win10_thai[@]}"
	"${_ttf_ms_win10_zh_cn[@]}"
	"${_ttf_ms_win10_zh_tw[@]}"
	"${_ttf_ms_win10_other[@]}"
	'license.rtf'
)

_cleanup_dummy_sources() {
	local _remove_src_links=${1:-false}
	local _name
	local _cache_file
	local _src_file
	local _link_target

	for _name in "${_dummy_source_names[@]}"; do
		_cache_file="${SRCDEST}/${_name}"
		[[ -f "${_cache_file}" && ! -s "${_cache_file}" ]] || continue

		_src_file="${srcdir}/${_name}"
		if [[ "${_remove_src_links}" == true && -L "${_src_file}" ]]; then
			_link_target=$(readlink -- "${_src_file}")
			if [[ "${_link_target}" == "${_cache_file}" ]]; then
				rm -f -- "${_src_file}" || return 1
			fi
		fi

		rm -f -- "${_cache_file}" || return 1
	done
}

verify() {
	if (( VERIFYSOURCE )); then
		_cleanup_dummy_sources false || return 1
	fi
}

_extract_from_remote_wim() (
	local _mountpoint="${srcdir}/mnt/wim-range-proxy"
	local _port_file="${srcdir}/mnt/wim-range-proxy.port"
	local _proxy_log="${srcdir}/mnt/wim-range-proxy.log"
	local _rclone_log="${srcdir}/mnt/wim-range-rclone.log"
	local _proxy_pid=''
	local _rclone_pid=''
	local _port=''
	local _mounted_wim=''
	local _wim_size=''
	local _attempt

	_dump_remote_logs() {
		if [[ -s "${_proxy_log}" ]]; then
			printf '%s\n' '  - udf-http-range-proxy log:' >&2
			cat -- "${_proxy_log}" >&2
		fi
		if [[ -s "${_rclone_log}" ]]; then
			printf '%s\n' '  - rclone log:' >&2
			cat -- "${_rclone_log}" >&2
		fi
	}

	_cleanup_remote_wim() {
		fusermount3 -uz "${_mountpoint}" >/dev/null 2>&1 || true
		if [[ -n "${_rclone_pid}" ]]; then
			kill "${_rclone_pid}" >/dev/null 2>&1 || true
			wait "${_rclone_pid}" >/dev/null 2>&1 || true
		fi
		if [[ -n "${_proxy_pid}" ]]; then
			kill "${_proxy_pid}" >/dev/null 2>&1 || true
			wait "${_proxy_pid}" >/dev/null 2>&1 || true
		fi
		rm -f -- "${_port_file}" "${_proxy_log}" "${_rclone_log}"
		rmdir -- "${_mountpoint}" >/dev/null 2>&1 || true
	}
	trap _cleanup_remote_wim EXIT

	fusermount3 -uz "${_mountpoint}" >/dev/null 2>&1 || true
	if ! mkdir -p -- "${_mountpoint}"; then
		printf 'Unable to create rclone mountpoint: %s\n' "${_mountpoint}" >&2
		return 1
	fi
	if ! rm -f -- "${_port_file}" "${_proxy_log}" "${_rclone_log}"; then
		printf '%s\n' 'Unable to reset range-proxy state files' >&2
		return 1
	fi

	printf '%s\n' '- Locating install.wim in the remote Windows ISO'
	udf-http-range-proxy "${_iso}" 'sources/install.wim' >"${_port_file}" 2>"${_proxy_log}" &
	_proxy_pid=$!
	for ((_attempt = 0; _attempt < 600; _attempt++)); do
		if [[ -s "${_port_file}" ]]; then
			read -r _port < "${_port_file}"
			break
		fi
		if ! kill -0 "${_proxy_pid}" 2>/dev/null; then
			printf '%s\n' '  - udf-http-range-proxy failed to start'
			cat -- "${_proxy_log}" >&2
			return 1
		fi
		sleep 0.1
	done
	if [[ ! "${_port}" =~ ^[0-9]+$ ]] || ((_port < 1 || _port > 65535)); then
		printf '%s\n' '  - udf-http-range-proxy did not provide a valid localhost port'
		cat -- "${_proxy_log}" >&2
		return 1
	fi

	printf '%s\n' '  - Mounting virtual install.wim through rclone'
	rclone mount ':http:' "${_mountpoint}" \
		--http-url "http://127.0.0.1:${_port}/" \
		--read-only \
		--no-modtime \
		--vfs-cache-mode off \
		>"${_rclone_log}" 2>&1 &
	_rclone_pid=$!
	_mounted_wim="${_mountpoint}/install.wim"
	for ((_attempt = 0; _attempt < 200; _attempt++)); do
		if [[ -f "${_mounted_wim}" ]]; then
			break
		fi
		if ! kill -0 "${_rclone_pid}" 2>/dev/null; then
			printf '%s\n' '  - rclone mount failed'
			cat -- "${_rclone_log}" >&2
			return 1
		fi
		sleep 0.1
	done
	if [[ ! -f "${_mounted_wim}" ]]; then
		printf '%s\n' '  - Timed out waiting for virtual install.wim'
		cat -- "${_rclone_log}" >&2
		return 1
	fi

	if ! _wim_size=$(stat -c '%s' -- "${_mounted_wim}"); then
		printf '%s\n' '  - Unable to determine virtual install.wim size' >&2
		_dump_remote_logs
		return 1
	fi
	if [[ ! "${_wim_size}" =~ ^[0-9]+$ ]] || ((_wim_size == 0)); then
		printf '%s\n' '  - Virtual install.wim has an invalid size' >&2
		_dump_remote_logs
		return 1
	fi
	printf '  - Virtual install.wim size: %s MiB\n' "$((_wim_size / 1048576))"

	printf '%s\n' '  - Extracting fonts from virtual install.wim'
	if ! 7z e -y -o"${srcdir}" "${_mounted_wim}" \
		'Windows/Fonts/*.ttf' \
		'Windows/Fonts/*.ttc' \
		'Windows/System32/Licenses/neutral/*/*/license.rtf'; then
		printf '%s\n' '  - Failed to extract fonts through the range-backed WIM' >&2
		_dump_remote_logs
		return 1
	fi
)

_download_and_extract_full_iso() (
	local _headers=''
	local _download_size=''
	local _existing_size=0
	local _actual_size=''
	local _remaining_download=''
	local _required_disk_space=''
	local _available_blocks=''
	local _block_size=''
	local _download_free_space=''
	local _src_free_space=''
	local _download_device=''
	local _src_device=''
	local _iso_name="${_iso##*/}"
	local _iso_file="${srcdir}/${_iso_name}"
	local _iso_preexisting=false
	local _download_probe=''
	local _extract_dir=''
	local _candidate

	_cleanup_full_iso() {
		if [[ -n "${_extract_dir}" && -d "${_extract_dir}" ]]; then
			rm -rf -- "${_extract_dir}"
		fi
	}
	trap _cleanup_full_iso EXIT

	printf '%s\n' '- Preparing fallback download of the full ISO'
	for _candidate in \
		"${SRCDEST}/${_iso_name}" \
		"${srcdir}/${_iso_name}"; do
		if [[ -f "${_candidate}" ]]; then
			_iso_file="${_candidate}"
			_iso_preexisting=true
			break
		fi
	done

	if [[ "${_iso_preexisting}" == false && ( -e "${_iso_file}" || -L "${_iso_file}" ) ]]; then
		printf 'ISO download path exists but is not a regular file: %s\n' "${_iso_file}" >&2
		return 1
	fi

	if [[ "${_iso_preexisting}" == true ]]; then
		if ! _existing_size=$(stat -Lc '%s' -- "${_iso_file}"); then
			printf 'Unable to determine size of existing ISO: %s\n' "${_iso_file}" >&2
			return 1
		fi
	fi

	if ! _headers=$(wget --spider --server-response --timeout=30 --tries=3 "${_iso}" 2>&1); then
		printf 'Unable to query ISO size from:\n%s\n' "${_iso}" >&2
		return 1
	fi
	_download_size=$(awk '
		tolower($1) ~ /^http\/[0-9.]+$/ {
			content_length = ""
			next
		}
		tolower($1) == "content-length:" {
			gsub("\r", "", $2)
			content_length = $2
		}
		END {
			if (content_length != "") print content_length
		}
	' <<< "${_headers}")
	if [[ ! "${_download_size}" =~ ^[0-9]+$ ]] || ((_download_size == 0)); then
		printf 'Unable to determine ISO size from:\n%s\n' "${_iso}" >&2
		return 1
	fi
	if ((_existing_size > _download_size)); then
		printf 'Existing ISO file is larger than the upstream object: %s\n' "${_iso_file}" >&2
		printf '%s\n' 'Refusing to overwrite or truncate the existing artifact.' >&2
		return 1
	fi

	_remaining_download=$((_download_size - _existing_size))
	if [[ -e "${_iso_file}" ]]; then
		_download_probe="${_iso_file}"
	else
		_download_probe=${_iso_file%/*}
	fi
	if ! _download_device=$(stat -Lc '%d' -- "${_download_probe}"); then
		printf 'Unable to determine ISO download filesystem: %s\n' "${_download_probe}" >&2
		return 1
	fi
	if ! _src_device=$(stat -Lc '%d' -- "${srcdir}"); then
		printf 'Unable to determine build filesystem: %s\n' "${srcdir}" >&2
		return 1
	fi
	if ! _available_blocks=$(stat -Lf --format='%a' -- "${_download_probe}"); then
		printf '%s\n' 'Unable to determine free space on ISO download filesystem' >&2
		return 1
	fi
	if ! _block_size=$(stat -Lf --format='%S' -- "${_download_probe}"); then
		printf '%s\n' 'Unable to determine block size on ISO download filesystem' >&2
		return 1
	fi
	_download_free_space=$((_available_blocks * _block_size))

	if [[ "${_download_device}" == "${_src_device}" ]]; then
		_required_disk_space=$((_remaining_download + _download_size))
		if ((_required_disk_space > _download_free_space)); then
			printf '%s\n' 'Not enough free disk space for the full-ISO fallback'
			printf 'Needed: %s MiB\n' "$((_required_disk_space / 1048576))"
			printf 'Available: %s MiB\n' "$((_download_free_space / 1048576))"
			return 1
		fi
	else
		if ((_remaining_download > _download_free_space)); then
			printf '%s\n' 'Not enough free disk space for the remaining ISO download'
			printf 'Needed: %s MiB\n' "$((_remaining_download / 1048576))"
			printf 'Available: %s MiB\n' "$((_download_free_space / 1048576))"
			return 1
		fi
		if ! _available_blocks=$(stat -f --format='%a' -- "${srcdir}"); then
			printf '%s\n' 'Unable to determine free space on build filesystem' >&2
			return 1
		fi
		if ! _block_size=$(stat -f --format='%S' -- "${srcdir}"); then
			printf '%s\n' 'Unable to determine block size on build filesystem' >&2
			return 1
		fi
		_src_free_space=$((_available_blocks * _block_size))
		if ((_download_size > _src_free_space)); then
			printf '%s\n' 'Not enough free disk space for ISO extraction on the build filesystem'
			printf 'Needed: %s MiB\n' "$((_download_size / 1048576))"
			printf 'Available: %s MiB\n' "$((_src_free_space / 1048576))"
			return 1
		fi
	fi

	if ((_existing_size < _download_size)); then
		printf '%s\n' '  - Downloading ISO'
		if ! (cd -- "${_iso_file%/*}" && wget --no-verbose --continue --tries=20 --waitretry=20 --timeout=60 "${_iso}"); then
			printf '%s\n' '  - Full ISO download failed' >&2
			return 1
		fi
	else
		printf '%s\n' '  - Existing ISO is complete; skipping download'
	fi
	if ! _actual_size=$(stat -Lc '%s' -- "${_iso_file}"); then
		printf '%s\n' '  - Unable to determine downloaded ISO size' >&2
		return 1
	fi
	if [[ ! "${_actual_size}" =~ ^[0-9]+$ ]] || ((_actual_size != _download_size)); then
		printf '%s\n' '  - Downloaded ISO size does not match Content-Length' >&2
		return 1
	fi

	if ! _extract_dir=$(mktemp -d "${srcdir}/full-iso-extract.XXXXXX"); then
		printf '%s\n' '  - Unable to create temporary extraction directory' >&2
		return 1
	fi
	printf '%s\n' '  - Extracting Windows installation image'
	if ! 7z x -y -o"${_extract_dir}" "${_iso_file}" 'sources/install.wim'; then
		printf '%s\n' '  - Failed to extract install.wim from the ISO' >&2
		return 1
	fi

	printf '%s\n' '  - Extracting fonts from local install.wim'
	if ! 7z e -y -o"${srcdir}" "${_extract_dir}/sources/install.wim" \
		'Windows/Fonts/*.ttf' \
		'Windows/Fonts/*.ttc' \
		'Windows/System32/Licenses/neutral/*/*/license.rtf'; then
		printf '%s\n' '  - Failed to extract fonts from install.wim' >&2
		return 1
	fi

	if ! rm -rf -- "${_extract_dir}"; then
		printf '%s\n' '  - Unable to remove temporary extraction directory' >&2
		return 1
	fi
	_extract_dir=''
	if [[ "${_iso_preexisting}" == false ]] && ! rm -f -- "${_iso_file}"; then
		printf '%s\n' '  - Unable to remove downloaded fallback ISO' >&2
		return 1
	fi
)

prepare() {
	local -a _all_files=()
	local -a _missing_files=()
	local _font
	local _checksum
	local _i
	local _fail=0

	cd -- "${srcdir}" || return 1
	_cleanup_dummy_sources true || return 1
	printf '%s\n' '- Examining locally available fonts and license'
	for _font in \
		"${_ttf_ms_win10[@]}" \
		"${_ttf_ms_win10_japanese[@]}" \
		"${_ttf_ms_win10_korean[@]}" \
		"${_ttf_ms_win10_sea[@]}" \
		"${_ttf_ms_win10_thai[@]}" \
		"${_ttf_ms_win10_zh_cn[@]}" \
		"${_ttf_ms_win10_zh_tw[@]}" \
		"${_ttf_ms_win10_other[@]}"; do
		_all_files+=("${_font}")
		[[ -f "${_font}" && -s "${_font}" ]] || _missing_files+=("${_font}")
	done
	_all_files+=('license.rtf')
	[[ -f 'license.rtf' && -s 'license.rtf' ]] || _missing_files+=('license.rtf')

	if ((${#_missing_files[@]} > 0)); then
		printf '%s\n' '- Required files are missing; downloading them from the Windows evaluation image'
		if ! _extract_from_remote_wim; then
			printf '%s\n' '- Range-backed extraction failed; falling back to the full ISO'
			_download_and_extract_full_iso || return 1
		fi
	fi

	if ((${#_b2sums[@]} != ${#_all_files[@]})); then
		printf 'Integrity metadata mismatch: %s files but %s BLAKE2 sums\n' \
			"${#_all_files[@]}" "${#_b2sums[@]}" >&2
		return 1
	fi

	printf '%s\n' '- Verifying file integrity'
	for _i in "${!_all_files[@]}"; do
		printf '  - %s: ' "${_all_files[_i]}"
		if [[ ! -f "${_all_files[_i]}" || ! -s "${_all_files[_i]}" ]]; then
			printf '%s\n' 'MISSING'
			_fail=1
		elif [[ "${_b2sums[_i]}" == 'SKIP' ]]; then
			printf '%s\n' 'Skipped'
		else
			_checksum=$(b2sum -- "${_all_files[_i]}")
			_checksum=${_checksum%% *}
			if [[ "${_b2sums[_i]}" == "${_checksum}" ]]; then
				printf '%s\n' 'Pass'
			else
				printf '%s\n' 'FAIL'
				_fail=1
			fi
		fi
	done
	if ((_fail != 0)); then
		printf '%s\n' 'One or more files failed the integrity check or are missing.' >&2
		return 1
	fi
}

_package() {
	local _current_pkgname="${pkgname[0]}"

	install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" -- "$@"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${_current_pkgname}" -- license.rtf
}

package_ttf-ms-win10-auto() {
	pkgdesc='Microsoft Windows 10 TrueType fonts'
	provides+=(
		'ttf-tahoma'
		'ttf-ms-fonts'
	)
	conflicts+=(
		'ttf-tahoma'
		'ttf-ms-fonts'
		'ttf-ms-win10'
		'ttf-ms-win8-auto'
		'ttf-win7-fonts-auto'
	)
	_package "${_ttf_ms_win10[@]}"
}

package_ttf-ms-win10-auto-japanese() {
	pkgdesc='Microsoft Windows 10 Japanese TrueType fonts'
	provides=(
		'ttf-font'
		"ttf-ms-win10-japanese=${pkgver}"
	)
	conflicts=(
		'ttf-ms-win10-japanese'
		'ttf-ms-win11-auto-japanese'
		'ttf-ms-win11-japanese'
		'ttf-ms-win8-auto-japanese'
		'ttf-win7-fonts-auto-japanese'
	)
	_package "${_ttf_ms_win10_japanese[@]}"
}

package_ttf-ms-win10-auto-korean() {
	pkgdesc='Microsoft Windows 10 Korean TrueType fonts'
	provides=(
		'ttf-font'
		"ttf-ms-win10-korean=${pkgver}"
	)
	conflicts=(
		'ttf-ms-win10-korean'
		'ttf-ms-win11-auto-korean'
		'ttf-ms-win11-korean'
		'ttf-ms-win8-auto-korean'
		'ttf-win7-fonts-auto-korean'
	)
	_package "${_ttf_ms_win10_korean[@]}"
}

package_ttf-ms-win10-auto-sea() {
	pkgdesc='Microsoft Windows 10 Southeast Asian TrueType fonts'
	provides=(
		'ttf-font'
		"ttf-ms-win10-sea=${pkgver}"
	)
	conflicts=(
		'ttf-ms-win10-sea'
		'ttf-ms-win11-auto-sea'
		'ttf-ms-win11-sea'
		'ttf-ms-win8-auto-sea'
		'ttf-win7-fonts-auto-sea'
	)
	_package "${_ttf_ms_win10_sea[@]}"
}

package_ttf-ms-win10-auto-thai() {
	pkgdesc='Microsoft Windows 10 Thai TrueType fonts'
	provides=(
		'ttf-font'
		"ttf-ms-win10-thai=${pkgver}"
	)
	conflicts=(
		'ttf-ms-win10-thai'
		'ttf-ms-win11-auto-thai'
		'ttf-ms-win11-thai'
		'ttf-ms-win8-auto-thai'
		'ttf-win7-fonts-auto-thai'
	)
	_package "${_ttf_ms_win10_thai[@]}"
}

package_ttf-ms-win10-auto-zh_cn() {
	pkgdesc='Microsoft Windows 10 Simplified Chinese TrueType fonts'
	provides=(
		'ttf-font'
		"ttf-ms-win10-zh_cn=${pkgver}"
	)
	conflicts=(
		'ttf-ms-win10-zh_cn'
		'ttf-ms-win11-auto-zh_cn'
		'ttf-ms-win11-zh_cn'
		'ttf-ms-win8-auto-zh_cn'
		'ttf-win7-fonts-auto-zh_cn'
	)
	_package "${_ttf_ms_win10_zh_cn[@]}"
}

package_ttf-ms-win10-auto-zh_tw() {
	pkgdesc='Microsoft Windows 10 Traditional Chinese TrueType fonts'
	provides=(
		'ttf-font'
		"ttf-ms-win10-zh_tw=${pkgver}"
	)
	conflicts=(
		'ttf-ms-win10-zh_tw'
		'ttf-ms-win11-auto-zh_tw'
		'ttf-ms-win11-zh_tw'
		'ttf-ms-win8-auto-zh_tw'
		'ttf-win7-fonts-auto-zh_tw'
	)
	_package "${_ttf_ms_win10_zh_tw[@]}"
}

package_ttf-ms-win10-auto-other() {
	pkgdesc='Microsoft Windows 10 Other TrueType fonts'
	provides=(
		'ttf-font'
		"ttf-ms-win10-other=${pkgver}"
	)
	conflicts=(
		'ttf-ms-win10-other'
		'ttf-ms-win11-auto-other'
		'ttf-ms-win11-other'
		'ttf-ms-win8-auto-other'
		'ttf-win7-fonts-auto-other'
	)
	_package "${_ttf_ms_win10_other[@]}"
}

# vim: ts=4 sw=4 noet
