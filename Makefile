CXX=g++

DEFS=-D_MT -DNOPCH -DFOURWAYSSE2 -DUSE_SSL

# Link boost statically
DEFS += -DBOOST_ALL_DYN_LINK

INCLUDEPATHS=-I/usr/include

LIBPATHS=-L/usr/lib

LIBS=-lboost_system -lboost_filesystem -lboost_program_options -lboost_thread -lboost_chrono -ldb_cxx -lssl -lcrypto

namecoin: USE_UPNP:=1
	ifdef USE_UPNP
		LIBS += -l miniupnpc
		DEFS += -DUSE_UPNP=$(USE_UPNP)
	endif
	
		# Linux-specific
		LIBS+= -lgthread-2.0 -lz -ldl -lpthread
	

namecoind: USE_UPNP:=0
	ifdef USE_UPNP
		LIBS += -lminiupnpc
		DEFS += -DUSE_UPNP=$(USE_UPNP)
	endif
		# Linux-specific
		LIBS+= -lgthread-2.0 -lz -ldl -lpthread


CXXFLAGS=-O2 -Wno-invalid-offsetof -Wformat $(DEFS) $(INCLUDEPATHS)
HEADERS=headers.h strlcpy.h serialize.h uint256.h util.h key.h bignum.h base58.h script.h allocators.h db.h walletdb.h crypter.h net.h irc.h keystore.h main.h wallet.h bitcoinrpc.h uibase.h ui.h noui.h init.h auxpow.h

OBJS= obj/auxpow.o \
    obj/util.o \
    obj/key.o \
    obj/script.o \
    obj/db.o \
    obj/walletdb.o \
    obj/crypter.o \
    obj/net.o \
    obj/irc.o \
    obj/keystore.o \
    obj/main.o \
    obj/wallet.o \
    obj/bitcoinrpc.o \
    obj/init.o \
    cryptopp/obj/sha.o \
    cryptopp/obj/cpu.o

all: namecoind


obj/%.o: %.cpp $(HEADERS)
	$(CXX) -c $(CXXFLAGS) -DGUI -o $@ $<

cryptopp/obj/%.o: cryptopp/%.cpp
	$(CXX) -c $(CXXFLAGS) -O3 -o $@ $<

obj/nogui/%.o: %.cpp $(HEADERS)
	$(CXX) -c $(CXXFLAGS) -o $@ $<

obj/test/%.o: test/%.cpp $(HEADERS)
	$(CXX) -c $(CFLAGS) -o $@ $<

obj/nogui/namecoin.o: namecoin.h

namecoind: $(OBJS:obj/%=obj/nogui/%) obj/nogui/namecoin.o
	$(CXX) $(CXXFLAGS) -o $@ $(LIBPATHS) $^ $(LIBS)

clean:
	-rm -f namecoin namecoind
	-rm -f obj/*.o
	-rm -f obj/nogui/*.o
	-rm -f obj/test/*.o
	-rm -f cryptopp/obj/*.o
	-rm -f headers.h.gch
