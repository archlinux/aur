
CPPFLAGS += -fPIC
ARCHIVE = libgeo.a
INCS    = cproj.h proj.h 

OBJECTS=		\
		$(ARCHIVE)(alberfor.o) $(ARCHIVE)(alberinv.o) \
		$(ARCHIVE)(alconfor.o) $(ARCHIVE)(alconinv.o) \
		$(ARCHIVE)(azimfor.o) $(ARCHIVE)(aziminv.o) \
		$(ARCHIVE)(eqconfor.o) $(ARCHIVE)(eqconinv.o) \
		$(ARCHIVE)(equifor.o) $(ARCHIVE)(equiinv.o) \
		$(ARCHIVE)(gnomfor.o) $(ARCHIVE)(gnominv.o) \
		$(ARCHIVE)(goodfor.o) $(ARCHIVE)(goodinv.o) \
		$(ARCHIVE)(gvnspfor.o) $(ARCHIVE)(gvnspinv.o) \
		$(ARCHIVE)(hamfor.o) $(ARCHIVE)(haminv.o) \
		$(ARCHIVE)(imolwfor.o) $(ARCHIVE)(imolwinv.o) \
		$(ARCHIVE)(lamazfor.o) $(ARCHIVE)(lamazinv.o) \
		$(ARCHIVE)(lamccfor.o) $(ARCHIVE)(lamccinv.o) \
		$(ARCHIVE)(merfor.o) $(ARCHIVE)(merinv.o) \
		$(ARCHIVE)(millfor.o) $(ARCHIVE)(millinv.o) \
		$(ARCHIVE)(molwfor.o) $(ARCHIVE)(molwinv.o) \
		$(ARCHIVE)(obleqfor.o) $(ARCHIVE)(obleqinv.o) \
		$(ARCHIVE)(omerfor.o) $(ARCHIVE)(omerinv.o) \
		$(ARCHIVE)(orthfor.o) $(ARCHIVE)(orthinv.o) \
		$(ARCHIVE)(polyfor.o) $(ARCHIVE)(polyinv.o) \
		$(ARCHIVE)(psfor.o) $(ARCHIVE)(psinv.o) \
		$(ARCHIVE)(robfor.o) $(ARCHIVE)(robinv.o) \
		$(ARCHIVE)(sinfor.o) $(ARCHIVE)(sininv.o) \
		$(ARCHIVE)(somfor.o) $(ARCHIVE)(sominv.o) \
		$(ARCHIVE)(sterfor.o) $(ARCHIVE)(sterinv.o) \
		$(ARCHIVE)(stplnfor.o) $(ARCHIVE)(stplninv.o) \
		$(ARCHIVE)(tmfor.o) $(ARCHIVE)(tminv.o) \
		$(ARCHIVE)(utmfor.o) $(ARCHIVE)(utminv.o) \
		$(ARCHIVE)(vandgfor.o) $(ARCHIVE)(vandginv.o) \
		$(ARCHIVE)(wivfor.o) $(ARCHIVE)(wivinv.o) \
		$(ARCHIVE)(wviifor.o) $(ARCHIVE)(wviiinv.o) \
		$(ARCHIVE)(for_init.o) $(ARCHIVE)(inv_init.o) \
		$(ARCHIVE)(cproj.o) $(ARCHIVE)(report.o) \
		$(ARCHIVE)(paksz.o) $(ARCHIVE)(sphdz.o) \
		$(ARCHIVE)(untfz.o) $(ARCHIVE)(gctp.o) \
		$(ARCHIVE)(br_gctp.o)

SOURCES = gctp.c alberfor.c alberinv.c alconfor.c alconinv.c azimfor.c \
	  aziminv.c eqconfor.c eqconinv.c equifor.c equiinv.c gnomfor.c \
	  gnominv.c goodfor.c goodinv.c gvnspfor.c gvnspinv.c hamfor.c \
	  haminv.c imolwfor.c imolwnv.c lamazfor.c lamazinv.c merfor.c \
	  merinv.c millfor.c millinv.c molwfor.c molwinv.c obleqfor.c  \
	  obleqinv.c omerfor.c omerinv.c orthfor.c orthinv.c polyfor.c \
	  polyinv.c psfor.c psinv.c robfor.c robinv.c sinfor.c sininv.c \
	  somfor.c sominv.c sterfor.c sterinv.c stplnfor.c stplninv.c \
	  tmfor.c tminv.c utmfor.c utminv.c vandgfor.c vandginv.c \
	  wivfor.c wivinv.c wviifor.c wviiinv.c for_init.c inv_init.c \
	  cproj.c report.c lamccfor.c lamccinv.c paksz.c untfz.c sphdz.c \
	  br_gctp.c Makefile cproj.h proj.h

$(ARCHIVE):	$(OBJECTS)


$(ARCHIVE)(gctp.o):	 	$(INCS)
$(ARCHIVE)(alberfor.o):	 	$(INCS)
$(ARCHIVE)(alberinv.o):	 	$(INCS)
$(ARCHIVE)(alconfor.o):	 	$(INCS)
$(ARCHIVE)(alconinv.o):	 	$(INCS)
$(ARCHIVE)(azimfor.o):	 	$(INCS)
$(ARCHIVE)(aziminv.o):	 	$(INCS)
$(ARCHIVE)(eqconfor.o):	 	$(INCS)
$(ARCHIVE)(eqconinv.o):	 	$(INCS)
$(ARCHIVE)(equifor.o):	 	$(INCS)
$(ARCHIVE)(equiinv.o):	 	$(INCS)
$(ARCHIVE)(for_init.o):	 	$(INCS)
$(ARCHIVE)(gnomfor.o):	 	$(INCS)
$(ARCHIVE)(gnominv.o):	 	$(INCS)
$(ARCHIVE)(goodfor.o):	 	$(INCS)
$(ARCHIVE)(goodinv.o):	 	$(INCS)
$(ARCHIVE)(gvnspfor.o):	 	$(INCS)
$(ARCHIVE)(gvnspinv.o):	 	$(INCS)
$(ARCHIVE)(hamfor.o):	 	$(INCS)
$(ARCHIVE)(haminv.o):	 	$(INCS)
$(ARCHIVE)(imolwfor.o):	 	$(INCS)
$(ARCHIVE)(imolwinv.o):	 	$(INCS)
$(ARCHIVE)(inv_init.o):	 	$(INCS)
$(ARCHIVE)(lamazfor.o):	 	$(INCS)
$(ARCHIVE)(lamazinv.o):	 	$(INCS)
$(ARCHIVE)(lamccfor.o):	 	$(INCS)
$(ARCHIVE)(lamccinv.o):	 	$(INCS)
$(ARCHIVE)(merfor.o):	 	$(INCS)
$(ARCHIVE)(merinv.o):	 	$(INCS)
$(ARCHIVE)(millfor.o):	 	$(INCS)
$(ARCHIVE)(millinv.o):	 	$(INCS)
$(ARCHIVE)(molwfor.o):	 	$(INCS)
$(ARCHIVE)(molwinv.o):	 	$(INCS)
$(ARCHIVE)(obleqfor.o):	 	$(INCS)
$(ARCHIVE)(obleqinv.o):	 	$(INCS)
$(ARCHIVE)(omerfor.o):	 	$(INCS)
$(ARCHIVE)(omerinv.o):	 	$(INCS)
$(ARCHIVE)(orthfor.o):	 	$(INCS)
$(ARCHIVE)(orthinv.o):	 	$(INCS)
$(ARCHIVE)(paksz.o):	 	$(INCS)
$(ARCHIVE)(polyinv.o):	 	$(INCS)
$(ARCHIVE)(polyfor.o):	 	$(INCS)
$(ARCHIVE)(psinv.o):	 	$(INCS)
$(ARCHIVE)(psfor.o):	 	$(INCS)
$(ARCHIVE)(robinv.o):	 	$(INCS)
$(ARCHIVE)(robfor.o):	 	$(INCS)
$(ARCHIVE)(sininv.o):	 	$(INCS)
$(ARCHIVE)(sinfor.o):	 	$(INCS)
$(ARCHIVE)(sominv.o):	 	$(INCS)
$(ARCHIVE)(somfor.o):	 	$(INCS)
$(ARCHIVE)(sphdz.o):	 	$(INCS)
$(ARCHIVE)(sterinv.o):	 	$(INCS)
$(ARCHIVE)(sterfor.o):	 	$(INCS)
$(ARCHIVE)(stplninv.o):	 	$(INCS)
$(ARCHIVE)(stplnfor.o):	 	$(INCS)
$(ARCHIVE)(tminv.o):	 	$(INCS)
$(ARCHIVE)(tmfor.o):	 	$(INCS)
$(ARCHIVE)(utminv.o):	 	$(INCS)
$(ARCHIVE)(utmfor.o):	 	$(INCS)
$(ARCHIVE)(untfz.o):	 	$(INCS)
$(ARCHIVE)(vandginv.o):	 	$(INCS)
$(ARCHIVE)(vandgfor.o):	 	$(INCS)
$(ARCHIVE)(wivinv.o):	 	$(INCS)
$(ARCHIVE)(wivfor.o):	 	$(INCS)
$(ARCHIVE)(wviiinv.o):	 	$(INCS)
$(ARCHIVE)(wviifor.o):	 	$(INCS)
$(ARCHIVE)(cproj.o):	 	$(INCS)
$(ARCHIVE)(report.o):	 	$(INCS)
$(ARCHIVE)(br_gctp.o):	 	$(INCS)
