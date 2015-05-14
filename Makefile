PREFIX=/usr/local
ARFLAGS=-cru
FFLAGS=-O2 -fPIC

major=4
version=$(major).1

objs=src/aaaaaa.o src/acosh.o src/ai.o src/aie.o src/albeta.o src/algams.o \
src/ali.o src/alngam.o src/alnrel.o src/asinh.o src/asyik.o src/asyjy.o \
src/atanh.o src/avint.o src/bakvec.o src/balanc.o src/balbak.o src/bandr.o \
src/bandv.o src/bcrh.o src/bdiff.o src/besi.o src/besi0.o src/besi0e.o \
src/besi1.o src/besi1e.o src/besj.o src/besj0.o src/besj1.o src/besk.o \
src/besk0.o src/besk0e.o src/besk1.o src/besk1e.o src/beskes.o src/besknu.o \
src/besks.o src/besy.o src/besy0.o src/besy1.o src/besynu.o src/beta.o \
src/betai.o src/bfqad.o src/bi.o src/bie.o src/binom.o src/bint4.o \
src/bintk.o src/bisect.o src/bkias.o src/bkisr.o src/bksol.o src/blktr1.o \
src/blktri.o src/bndacc.o src/bndsol.o src/bnfac.o src/bnslv.o src/bqr.o \
src/bsgq8.o src/bskin.o src/bspdoc.o src/bspdr.o src/bspev.o src/bsplvd.o \
src/bsplvn.o src/bsppp.o src/bspvd.o src/bspvn.o src/bsqad.o src/bsrh.o \
src/bvalu.o src/c0lgmc.o src/c1merg.o src/c9lgmc.o src/c9ln2r.o src/cacai.o \
src/cacon.o src/cacos.o src/cacosh.o src/cairy.o src/carg.o src/casin.o \
src/casinh.o src/casyi.o src/catan.o src/catan2.o src/catanh.o src/caxpy.o \
src/cbabk2.o src/cbal.o src/cbesh.o src/cbesi.o src/cbesj.o src/cbesk.o \
src/cbesy.o src/cbeta.o src/cbinu.o src/cbiry.o src/cbknu.o src/cblkt1.o \
src/cblktr.o src/cbrt.o src/cbuni.o src/cbunk.o src/ccbrt.o src/cchdc.o \
src/cchdd.o src/cchex.o src/cchud.o src/ccmpb.o src/ccopy.o src/ccosh.o \
src/ccot.o src/cdcdot.o src/cdcor.o src/cdcst.o src/cdiv.o src/cdntl.o \
src/cdntp.o src/cdotc.o src/cdotu.o src/cdpsc.o src/cdpst.o src/cdriv1.o \
src/cdriv2.o src/cdriv3.o src/cdscl.o src/cdstp.o src/cdzro.o src/cexprl.o \
src/cfftb.o src/cfftb1.o src/cfftf.o src/cfftf1.o src/cffti.o src/cffti1.o \
src/cfod.o src/cg.o src/cgamma.o src/cgamr.o src/cgbco.o src/cgbdi.o \
src/cgbfa.o src/cgbmv.o src/cgbsl.o src/cgeco.o src/cgedi.o src/cgeev.o \
src/cgefa.o src/cgefs.o src/cgeir.o src/cgemm.o src/cgemv.o src/cgerc.o \
src/cgeru.o src/cgesl.o src/cgtsl.o src/ch.o src/chbmv.o src/chemm.o \
src/chemv.o src/cher.o src/cher2.o src/cher2k.o src/cherk.o src/chfcm.o \
src/chfdv.o src/chfev.o src/chfie.o src/chico.o src/chidi.o src/chiev.o \
src/chifa.o src/chisl.o src/chkder.o src/chkpr4.o src/chkprm.o src/chksn4.o \
src/chksng.o src/chpco.o src/chpdi.o src/chpfa.o src/chpmv.o src/chpr.o \
src/chpr2.o src/chpsl.o src/chu.o src/cinvit.o src/ckscl.o src/clbeta.o \
src/clngam.o src/clnrel.o src/clog10.o src/cmgnbn.o src/cmlri.o src/cmpcsg.o \
src/cmposd.o src/cmposn.o src/cmposp.o src/cmptr3.o src/cmptrx.o src/cnbco.o \
src/cnbdi.o src/cnbfa.o src/cnbfs.o src/cnbir.o src/cnbsl.o src/combak.o \
src/comhes.o src/comlr.o src/comlr2.o src/compb.o src/comqr.o src/comqr2.o \
src/cortb.o src/corth.o src/cosdg.o src/cosgen.o src/cosqb.o src/cosqb1.o \
src/cosqf.o src/cosqf1.o src/cosqi.o src/cost.o src/costi.o src/cot.o \
src/cpadd.o src/cpbco.o src/cpbdi.o src/cpbfa.o src/cpbsl.o src/cpevl.o \
src/cpevlr.o src/cpoco.o src/cpodi.o src/cpofa.o src/cpofs.o src/cpoir.o \
src/cposl.o src/cppco.o src/cppdi.o src/cppfa.o src/cppsl.o src/cpqr79.o \
src/cproc.o src/cprocp.o src/cprod.o src/cprodp.o src/cpsi.o src/cptsl.o \
src/cpzero.o src/cqrdc.o src/cqrsl.o src/crati.o src/crotg.o src/cs1s2.o \
src/cscal.o src/cseri.o src/csevl.o src/cshch.o src/csico.o src/csidi.o \
src/csifa.o src/csinh.o src/csisl.o src/cspco.o src/cspdi.o src/cspfa.o \
src/cspsl.o src/csroot.o src/csrot.o src/csscal.o src/csvdc.o src/cswap.o \
src/csymm.o src/csyr2k.o src/csyrk.o src/ctan.o src/ctanh.o src/ctbmv.o \
src/ctbsv.o src/ctpmv.o src/ctpsv.o src/ctrco.o src/ctrdi.o src/ctrmm.o \
src/ctrmv.o src/ctrsl.o src/ctrsm.o src/ctrsv.o src/cuchk.o src/cunhj.o \
src/cuni1.o src/cuni2.o src/cunik.o src/cunk1.o src/cunk2.o src/cuoik.o \
src/cv.o src/cwrsk.o src/d1mach.o src/d1merg.o src/d1mpyq.o src/d1updt.o \
src/d9aimp.o src/d9atn1.o src/d9b0mp.o src/d9b1mp.o src/d9chu.o src/d9gmic.o \
src/d9gmit.o src/d9knus.o src/d9lgic.o src/d9lgit.o src/d9lgmc.o src/d9ln2r.o \
src/d9pak.o src/d9upak.o src/dacosh.o src/dai.o src/daie.o src/dasinh.o \
src/dasum.o src/dasyik.o src/dasyjy.o src/datanh.o src/davint.o src/daws.o \
src/daxpy.o src/dbcg.o src/dbdiff.o src/dbesi.o src/dbesi0.o src/dbesi1.o \
src/dbesj.o src/dbesj0.o src/dbesj1.o src/dbesk.o src/dbesk0.o src/dbesk1.o \
src/dbesks.o src/dbesy.o src/dbesy0.o src/dbesy1.o src/dbeta.o src/dbetai.o \
src/dbfqad.o src/dbhin.o src/dbi.o src/dbie.o src/dbinom.o src/dbint4.o \
src/dbintk.o src/dbkias.o src/dbkisr.o src/dbndac.o src/dbndsl.o src/dbnfac.o \
src/dbnslv.o src/dbocls.o src/dbols.o src/dbolsm.o src/dbsgq8.o src/dbsi0e.o \
src/dbsi1e.o src/dbsk0e.o src/dbsk1e.o src/dbskes.o src/dbskin.o src/dbsknu.o \
src/dbspdr.o src/dbspev.o src/dbsppp.o src/dbspvd.o src/dbspvn.o src/dbsqad.o \
src/dbsynu.o src/dbvalu.o src/dcbrt.o src/dcdot.o src/dcfod.o src/dcg.o \
src/dcgn.o src/dcgs.o src/dchdc.o src/dchdd.o src/dchex.o src/dchfcm.o \
src/dchfdv.o src/dchfev.o src/dchfie.o src/dchkw.o src/dchu.o src/dchud.o \
src/dckder.o src/dcopy.o src/dcopym.o src/dcosdg.o src/dcot.o src/dcov.o \
src/dcpplt.o src/dcsevl.o src/dcv.o src/ddaini.o src/ddajac.o src/ddanrm.o \
src/ddaslv.o src/ddassl.o src/ddastp.o src/ddatrp.o src/ddaws.o src/ddawts.o \
src/ddcor.o src/ddcst.o src/ddeabm.o src/ddebdf.o src/dderkf.o src/ddes.o \
src/ddntl.o src/ddntp.o src/ddoglg.o src/ddot.o src/ddpsc.o src/ddpst.o \
src/ddriv1.o src/ddriv2.o src/ddriv3.o src/ddscl.o src/ddstp.o src/ddzro.o \
src/de1.o src/deabm.o src/debdf.o src/defc.o src/defcmn.o src/defe4.o \
src/defehl.o src/defer.o src/dei.o src/denorm.o src/derf.o src/derfc.o \
src/derkf.o src/derkfs.o src/des.o src/dexint.o src/dexprl.o src/dfac.o \
src/dfc.o src/dfcmn.o src/dfdjc1.o src/dfdjc3.o src/dfehl.o src/dfspvd.o \
src/dfspvn.o src/dfulmt.o src/dfzero.o src/dgami.o src/dgamic.o src/dgamit.o \
src/dgamlm.o src/dgamln.o src/dgamma.o src/dgamr.o src/dgamrn.o src/dgaus8.o \
src/dgbco.o src/dgbdi.o src/dgbfa.o src/dgbmv.o src/dgbsl.o src/dgeco.o \
src/dgedi.o src/dgefa.o src/dgefs.o src/dgemm.o src/dgemv.o src/dger.o \
src/dgesl.o src/dglss.o src/dgmres.o src/dgtsl.o src/dh12.o src/dhels.o \
src/dheqr.o src/dhfti.o src/dhkseq.o src/dhstrt.o src/dhvnrm.o src/dintp.o \
src/dintrv.o src/dintyd.o src/dir.o src/djairy.o src/dlbeta.o src/dlgams.o \
src/dli.o src/dllsia.o src/dllti2.o src/dlngam.o src/dlnrel.o src/dlpdoc.o \
src/dlpdp.o src/dlsei.o src/dlsi.o src/dlsod.o src/dmout.o src/dmpar.o \
src/dnbco.o src/dnbdi.o src/dnbfa.o src/dnbfs.o src/dnbsl.o src/dnls1.o \
src/dnls1e.o src/dnrm2.o src/dnsq.o src/dnsqe.o src/dogleg.o src/domn.o \
src/dorth.o src/dp1vlu.o src/dpbco.o src/dpbdi.o src/dpbfa.o src/dpbsl.o \
src/dpchbs.o src/dpchce.o src/dpchci.o src/dpchcm.o src/dpchcs.o src/dpchdf.o \
src/dpchfd.o src/dpchfe.o src/dpchia.o src/dpchic.o src/dpchid.o src/dpchim.o \
src/dpchkt.o src/dpchng.o src/dpchsp.o src/dpchst.o src/dpchsw.o src/dpcoef.o \
src/dpfqad.o src/dpigmr.o src/dpincw.o src/dpinit.o src/dpintm.o src/dpjac.o \
src/dplint.o src/dplpce.o src/dplpdm.o src/dplpfe.o src/dplpfl.o src/dplpmn.o \
src/dplpmu.o src/dplpup.o src/dpnnzr.o src/dpoch.o src/dpoch1.o src/dpoco.o \
src/dpodi.o src/dpofa.o src/dpofs.o src/dpolcf.o src/dpolft.o src/dpolvl.o \
src/dpopt.o src/dposl.o src/dppco.o src/dppdi.o src/dpperm.o src/dppfa.o \
src/dppgq8.o src/dppqad.o src/dppsl.o src/dppval.o src/dprwpg.o src/dprwvr.o \
src/dpsi.o src/dpsifn.o src/dpsixn.o src/dpsort.o src/dptsl.o src/dqag.o \
src/dqage.o src/dqagi.o src/dqagie.o src/dqagp.o src/dqagpe.o src/dqags.o \
src/dqagse.o src/dqawc.o src/dqawce.o src/dqawf.o src/dqawfe.o src/dqawo.o \
src/dqawoe.o src/dqaws.o src/dqawse.o src/dqc25c.o src/dqc25f.o src/dqc25s.o \
src/dqcheb.o src/dqdota.o src/dqdoti.o src/dqelg.o src/dqform.o src/dqk15.o \
src/dqk15i.o src/dqk15w.o src/dqk21.o src/dqk31.o src/dqk41.o src/dqk51.o \
src/dqk61.o src/dqmomo.o src/dqnc79.o src/dqng.o src/dqpsrt.o src/dqrdc.o \
src/dqrfac.o src/dqrsl.o src/dqrslv.o src/dqwgtc.o src/dqwgtf.o src/dqwgts.o \
src/drc.o src/drc3jj.o src/drc3jm.o src/drc6j.o src/drd.o src/dreadp.o \
src/drf.o src/drj.o src/drkfs.o src/drlcal.o src/drot.o src/drotg.o \
src/drotm.o src/drotmg.o src/drsco.o src/ds2lt.o src/ds2y.o src/dsbmv.o \
src/dscal.o src/dsd2s.o src/dsdbcg.o src/dsdcg.o src/dsdcgn.o src/dsdcgs.o \
src/dsdgmr.o src/dsdi.o src/dsdomn.o src/dsdot.o src/dsds.o src/dsdscl.o \
src/dsgs.o src/dsiccg.o src/dsico.o src/dsics.o src/dsidi.o src/dsifa.o \
src/dsilur.o src/dsilus.o src/dsindg.o src/dsisl.o src/dsjac.o src/dsli.o \
src/dsli2.o src/dsllti.o src/dslubc.o src/dslucn.o src/dslucs.o src/dslugm.o \
src/dslui.o src/dslui2.o src/dslui4.o src/dsluom.o src/dsluti.o src/dslvs.o \
src/dsmmi2.o src/dsmmti.o src/dsmtv.o src/dsmv.o src/dsort.o src/dsos.o \
src/dsoseq.o src/dsossl.o src/dspco.o src/dspdi.o src/dspenc.o src/dspfa.o \
src/dsplp.o src/dspmv.o src/dspr.o src/dspr2.o src/dspsl.o src/dsteps.o \
src/dstod.o src/dsvco.o src/dsvdc.o src/dswap.o src/dsymm.o src/dsymv.o \
src/dsyr.o src/dsyr2.o src/dsyr2k.o src/dsyrk.o src/dtbmv.o src/dtbsv.o \
src/dtin.o src/dtout.o src/dtpmv.o src/dtpsv.o src/dtrco.o src/dtrdi.o \
src/dtrmm.o src/dtrmv.o src/dtrsl.o src/dtrsm.o src/dtrsv.o src/du11ls.o \
src/du11us.o src/du12ls.o src/du12us.o src/dulsia.o src/dusrmt.o src/dvnrms.o \
src/dvout.o src/dwnlit.o src/dwnlsm.o src/dwnlt1.o src/dwnlt2.o src/dwnlt3.o \
src/dwnnls.o src/dwritp.o src/dwupdt.o src/dx.o src/dx4.o src/dxadd.o \
src/dxadj.o src/dxc210.o src/dxcon.o src/dxlcal.o src/dxlegf.o src/dxnrmp.o \
src/dxpmu.o src/dxpmup.o src/dxpnrm.o src/dxpqnu.o src/dxpsi.o src/dxqmu.o \
src/dxqnu.o src/dxred.o src/dxset.o src/dy.o src/dy4.o src/dyairy.o src/e1.o \
src/efc.o src/efcmn.o src/ei.o src/eisdoc.o src/elmbak.o src/elmhes.o \
src/eltran.o src/enorm.o src/erf.o src/erfc.o src/exint.o src/exprel.o \
src/ezfft1.o src/ezfftb.o src/ezfftf.o src/ezffti.o src/fac.o src/fc.o \
src/fcmn.o src/fdjac1.o src/fdjac3.o src/fdump.o src/fftdoc.o src/figi.o \
src/figi2.o src/fulmat.o src/fundoc.o src/fzero.o src/gami.o src/gamic.o \
src/gamit.o src/gamlim.o src/gamln.o src/gamma.o src/gamr.o src/gamrn.o \
src/gaus8.o src/genbun.o src/h12.o src/hfti.o src/hkseq.o src/hpperm.o \
src/hpsort.o src/hqr.o src/hqr2.o src/hstart.o src/hstcrt.o src/hstcs1.o \
src/hstcsp.o src/hstcyl.o src/hstplr.o src/hstssp.o src/htrib3.o src/htribk.o \
src/htrid3.o src/htridi.o src/hvnrm.o src/hw3crt.o src/hwscrt.o src/hwscs1.o \
src/hwscsp.o src/hwscyl.o src/hwsplr.o src/hwsss1.o src/hwsssp.o src/i1mach.o \
src/i1merg.o src/icamax.o src/icopy.o src/idamax.o src/idloc.o src/imtql1.o \
src/imtql2.o src/imtqlv.o src/indxa.o src/indxb.o src/indxc.o src/initds.o \
src/inits.o src/intrv.o src/intyd.o src/invit.o src/inxca.o src/inxcb.o \
src/inxcc.o src/iploc.o src/ipperm.o src/ipsort.o src/isamax.o src/isdbcg.o \
src/isdcg.o src/isdcgn.o src/isdcgs.o src/isdgmr.o src/isdir.o src/isdomn.o \
src/isort.o src/issbcg.o src/isscg.o src/isscgn.o src/isscgs.o src/issgmr.o \
src/issir.o src/issomn.o src/iswap.o src/ivout.o src/j4save.o src/jairy.o \
src/la05ad.o src/la05as.o src/la05bd.o src/la05bs.o src/la05cd.o src/la05cs.o \
src/la05ed.o src/la05es.o src/llsia.o src/lmpar.o src/lpdp.o src/lsame.o \
src/lsei.o src/lsi.o src/lsod.o src/mc20ad.o src/mc20as.o src/minfit.o \
src/minso4.o src/minsol.o src/mpadd.o src/mpadd2.o src/mpadd3.o src/mpblas.o \
src/mpcdm.o src/mpchk.o src/mpcmd.o src/mpdivi.o src/mperr.o src/mpmaxr.o \
src/mpmlp.o src/mpmul.o src/mpmul2.o src/mpmuli.o src/mpnzr.o src/mpovfl.o \
src/mpstr.o src/mpunfl.o src/numxer.o src/ortbak.o src/orthes.o src/ortho4.o \
src/orthog.o src/ortran.o src/passb.o src/passb2.o src/passb3.o src/passb4.o \
src/passb5.o src/passf.o src/passf2.o src/passf3.o src/passf4.o src/passf5.o \
src/pchbs.o src/pchce.o src/pchci.o src/pchcm.o src/pchcs.o src/pchdf.o \
src/pchdoc.o src/pchfd.o src/pchfe.o src/pchia.o src/pchic.o src/pchid.o \
src/pchim.o src/pchkt.o src/pchngs.o src/pchsp.o src/pchst.o src/pchsw.o \
src/pcoef.o src/pfqad.o src/pgsf.o src/pimach.o src/pinitm.o src/pjac.o \
src/pnnzrs.o src/poch.o src/poch1.o src/pois3d.o src/poisd2.o src/poisn2.o \
src/poisp2.o src/poistg.o src/polcof.o src/polfit.o src/polint.o src/polyvl.o \
src/pos3d1.o src/postg2.o src/ppadd.o src/ppgq8.o src/ppgsf.o src/pppsf.o \
src/ppqad.o src/ppsgf.o src/ppspf.o src/ppval.o src/proc.o src/procp.o \
src/prod.o src/prodp.o src/prwpge.o src/prwvir.o src/psgf.o src/psi.o \
src/psifn.o src/psixn.o src/pvalue.o src/pythag.o src/qag.o src/qage.o \
src/qagi.o src/qagie.o src/qagp.o src/qagpe.o src/qags.o src/qagse.o \
src/qawc.o src/qawce.o src/qawf.o src/qawfe.o src/qawo.o src/qawoe.o \
src/qaws.o src/qawse.o src/qc25c.o src/qc25f.o src/qc25s.o src/qcheb.o \
src/qelg.o src/qform.o src/qk15.o src/qk15i.o src/qk15w.o src/qk21.o \
src/qk31.o src/qk41.o src/qk51.o src/qk61.o src/qmomo.o src/qnc79.o src/qng.o \
src/qpdoc.o src/qpsrt.o src/qrfac.o src/qrsolv.o src/qs2i1d.o src/qs2i1r.o \
src/qwgtc.o src/qwgtf.o src/qwgts.o src/qzhes.o src/qzit.o src/qzval.o \
src/qzvec.o src/r1mach.o src/r1mpyq.o src/r1updt.o src/r9aimp.o src/r9atn1.o \
src/r9chu.o src/r9gmic.o src/r9gmit.o src/r9knus.o src/r9lgic.o src/r9lgit.o \
src/r9lgmc.o src/r9ln2r.o src/r9pak.o src/r9upak.o src/radb2.o src/radb3.o \
src/radb4.o src/radb5.o src/radbg.o src/radf2.o src/radf3.o src/radf4.o \
src/radf5.o src/radfg.o src/rand.o src/ratqr.o src/rc.o src/rc3jj.o \
src/rc3jm.o src/rc6j.o src/rd.o src/rebak.o src/rebakb.o src/reduc.o \
src/reduc2.o src/rf.o src/rfftb.o src/rfftb1.o src/rfftf.o src/rfftf1.o \
src/rffti.o src/rffti1.o src/rg.o src/rgauss.o src/rgg.o src/rj.o \
src/rpqr79.o src/rpzero.o src/rs.o src/rsb.o src/rsco.o src/rsg.o src/rsgab.o \
src/rsgba.o src/rsp.o src/rst.o src/rt.o src/runif.o src/rwupdt.o \
src/s1merg.o src/sasum.o src/saxpy.o src/sbcg.o src/sbhin.o src/sbocls.o \
src/sbols.o src/sbolsm.o src/scasum.o src/scg.o src/scgn.o src/scgs.o \
src/schdc.o src/schdd.o src/schex.o src/schkw.o src/schud.o src/sclosm.o \
src/scnrm2.o src/scopy.o src/scopym.o src/scov.o src/scpplt.o src/sdaini.o \
src/sdajac.o src/sdanrm.o src/sdaslv.o src/sdassl.o src/sdastp.o src/sdatrp.o \
src/sdawts.o src/sdcor.o src/sdcst.o src/sdntl.o src/sdntp.o src/sdot.o \
src/sdpsc.o src/sdpst.o src/sdriv1.o src/sdriv2.o src/sdriv3.o src/sdscl.o \
src/sdsdot.o src/sdstp.o src/sdzro.o src/sepeli.o src/sepx4.o src/sgbco.o \
src/sgbdi.o src/sgbfa.o src/sgbmv.o src/sgbsl.o src/sgeco.o src/sgedi.o \
src/sgeev.o src/sgefa.o src/sgefs.o src/sgeir.o src/sgemm.o src/sgemv.o \
src/sger.o src/sgesl.o src/sglss.o src/sgmres.o src/sgtsl.o src/shels.o \
src/sheqr.o src/sindg.o src/sinqb.o src/sinqf.o src/sinqi.o src/sint.o \
src/sinti.o src/sintrp.o src/sir.o src/sllti2.o src/slpdoc.o src/slvs.o \
src/smout.o src/snbco.o src/snbdi.o src/snbfa.o src/snbfs.o src/snbir.o \
src/snbsl.o src/snls1.o src/snls1e.o src/snrm2.o src/snsq.o src/snsqe.o \
src/somn.o src/sopenm.o src/sorth.o src/sos.o src/soseqs.o src/sossol.o \
src/spbco.o src/spbdi.o src/spbfa.o src/spbsl.o src/speli4.o src/spelip.o \
src/spenc.o src/spigmr.o src/spincw.o src/spinit.o src/splp.o src/splpce.o \
src/splpdm.o src/splpfe.o src/splpfl.o src/splpmn.o src/splpmu.o src/splpup.o \
src/spoco.o src/spodi.o src/spofa.o src/spofs.o src/spoir.o src/spopt.o \
src/sposl.o src/sppco.o src/sppdi.o src/spperm.o src/sppfa.o src/sppsl.o \
src/spsort.o src/sptsl.o src/sqrdc.o src/sqrsl.o src/sreadp.o src/srlcal.o \
src/srot.o src/srotg.o src/srotm.o src/srotmg.o src/ss2lt.o src/ss2y.o \
src/ssbmv.o src/sscal.o src/ssd2s.o src/ssdbcg.o src/ssdcg.o src/ssdcgn.o \
src/ssdcgs.o src/ssdgmr.o src/ssdi.o src/ssdomn.o src/ssds.o src/ssdscl.o \
src/ssgs.o src/ssiccg.o src/ssico.o src/ssics.o src/ssidi.o src/ssiev.o \
src/ssifa.o src/ssilur.o src/ssilus.o src/ssisl.o src/ssjac.o src/ssli.o \
src/ssli2.o src/ssllti.o src/sslubc.o src/sslucn.o src/sslucs.o src/sslugm.o \
src/sslui.o src/sslui2.o src/sslui4.o src/ssluom.o src/ssluti.o src/ssmmi2.o \
src/ssmmti.o src/ssmtv.o src/ssmv.o src/ssort.o src/sspco.o src/sspdi.o \
src/sspev.o src/sspfa.o src/sspmv.o src/sspr.o src/sspr2.o src/sspsl.o \
src/ssvdc.o src/sswap.o src/ssymm.o src/ssymv.o src/ssyr.o src/ssyr2.o \
src/ssyr2k.o src/ssyrk.o src/stbmv.o src/stbsv.o src/steps.o src/stin.o \
src/stod.o src/stout.o src/stpmv.o src/stpsv.o src/strco.o src/strdi.o \
src/strmm.o src/strmv.o src/strsl.o src/strsm.o src/strsv.o src/svco.o \
src/svd.o src/svout.o src/swritp.o src/sxlcal.o src/tevlc.o src/tevls.o \
src/tinvit.o src/tql1.o src/tql2.o src/tqlrat.o src/trbak1.o src/trbak3.o \
src/tred1.o src/tred2.o src/tred3.o src/tri3.o src/tridib.o src/tridq.o \
src/tris4.o src/trisp.o src/trix.o src/tsturm.o src/u11ls.o src/u11us.o \
src/u12ls.o src/u12us.o src/ulsia.o src/usrmat.o src/vnwrms.o src/wnlit.o \
src/wnlsm.o src/wnlt1.o src/wnlt2.o src/wnlt3.o src/wnnls.o src/xadd.o \
src/xadj.o src/xc210.o src/xcon.o src/xerbla.o src/xerclr.o src/xercnt.o \
src/xerdmp.o src/xerhlt.o src/xermax.o src/xermsg.o src/xerprn.o src/xersve.o \
src/xgetf.o src/xgetua.o src/xgetun.o src/xlegf.o src/xnrmp.o src/xpmu.o \
src/xpmup.o src/xpnrm.o src/xpqnu.o src/xpsi.o src/xqmu.o src/xqnu.o \
src/xred.o src/xset.o src/xsetf.o src/xsetua.o src/xsetun.o src/yairy.o \
src/zabs.o src/zacai.o src/zacon.o src/zairy.o src/zasyi.o src/zbesh.o \
src/zbesi.o src/zbesj.o src/zbesk.o src/zbesy.o src/zbinu.o src/zbiry.o \
src/zbknu.o src/zbuni.o src/zbunk.o src/zdiv.o src/zexp.o src/zkscl.o \
src/zlog.o src/zmlri.o src/zmlt.o src/zrati.o src/zs1s2.o src/zseri.o \
src/zshch.o src/zsqrt.o src/zuchk.o src/zunhj.o src/zuni1.o src/zuni2.o \
src/zunik.o src/zunk1.o src/zunk2.o src/zuoik.o src/zwrsk.o

objs_dbvp=src/dbksol.o src/dbvder.o src/dbvpor.o src/dbvsup.o src/dcoef.o \
src/dcscal.o src/dexbvp.o src/dlssud.o src/dmacon.o src/dmgsbv.o src/dohtrl.o \
src/dorthr.o src/dprvec.o src/dreort.o src/drkfab.o src/dstor1.o src/dstway.o \
src/dsuds.o src/dvecs.o $(objs)

objs_sbvp=src/bvder.o src/bvpor.o src/bvsup.o src/cscale.o src/exbvp.o \
src/lssods.o src/lssuds.o src/macon.o src/mgsbv.o src/ohtrol.o src/ohtror.o \
src/orthol.o src/orthor.o src/prvec.o src/reort.o src/rkfab.o src/scoef.o \
src/sods.o src/stor1.o src/stway.o src/suds.o src/svecs.o $(objs)

all: lib/libslatec.so lib/libslatec.a lib/libslatec-dbvp.a lib/libslatec-sbvp.a

clean:
	rm -fr lib src/*.o

install:
	install -d $(DESTDIR)$(PREFIX)/lib
	install -m644 -t $(DESTDIR)$(PREFIX)/lib \
	    lib/libslatec.a lib/libslatec-dbvp.a lib/libslatec-sbvp.a
	install -m755 -t $(DESTDIR)$(PREFIX)/lib lib/libslatec.so.$(version)
	cp -P lib/libslatec.so lib/libslatec.so.$(major) \
	    $(DESTDIR)$(PREFIX)/lib

uninstall:
	rm -f \
	    $(DESTDIR)$(PREFIX)/lib/libslatec.a \
	    $(DESTDIR)$(PREFIX)/lib/libslatec-sbvp.a \
	    $(DESTDIR)$(PREFIX)/lib/libslatec-dbvp.a \
	    $(DESTDIR)$(PREFIX)/lib/libslatec.so \
	    $(DESTDIR)$(PREFIX)/lib/libslatec.so.$(major) \
	    $(DESTDIR)$(PREFIX)/lib/libslatec.so.$(version)

.PHONY: all clean install uninstall

lib/libslatec.a: $(objs)
	mkdir -p lib
	$(AR) $(ARFLAGS) $@ $(objs)

lib/libslatec-dbvp.a: $(objs_dbvp)
	mkdir -p lib
	$(AR) $(ARFLAGS) $@ $(objs_dbvp)

lib/libslatec-sbvp.a: $(objs_sbvp)
	mkdir -p lib
	$(AR) $(ARFLAGS) $@ $(objs_sbvp)

lib/libslatec.so: lib/libslatec.so.$(major)
	ln -fs libslatec.so.$(major) $@

lib/libslatec.so.$(major): lib/libslatec.so.$(version)
	ln -fs libslatec.so.$(version) $@

lib/libslatec.so.$(version): $(objs)
	mkdir -p lib
	$(FC) $(LDFLAGS) -shared -Wl,-soname,libslatec.so.$(major) \
	    -o $@ $(objs)
