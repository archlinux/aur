using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Security;
using System.Security.Permissions;
using System.Text;

namespace Galaxy.Api
{
	public enum AvatarType
	{
		AVATAR_TYPE_NONE = 0,
		AVATAR_TYPE_SMALL = 1,
		AVATAR_TYPE_MEDIUM = 2,
		AVATAR_TYPE_LARGE = 4
	}
	public enum ChatMessageType
	{
		CHAT_MESSAGE_TYPE_UNKNOWN,
		CHAT_MESSAGE_TYPE_CHAT_MESSAGE,
		CHAT_MESSAGE_TYPE_GAME_INVITATION
	}
	public enum ConnectionType
	{
		CONNECTION_TYPE_NONE,
		CONNECTION_TYPE_DIRECT,
		CONNECTION_TYPE_PROXY
	}
	public class GalaxyID : IDisposable
	{
		public virtual void Dispose()
		{
		}

		public enum IDType
		{
			ID_TYPE_UNASSIGNED,
			ID_TYPE_LOBBY,
			ID_TYPE_USER
		}

		public static bool operator ==(GalaxyID other1, GalaxyID other2)
		{
			if ((object)other1 == null && (object)other2 == null)
			{
				return true;
			}
			if ((object)other1 == null || (object)other2 == null)
			{
				return false;
			}
			return other1.operator_equals(other2);
		}

		public static bool operator !=(GalaxyID other1, GalaxyID other2)
		{
			if ((object)other1 == null && (object)other2 == null)
			{
				return false;
			}
			if ((object)other1 == null || (object)other2 == null)
			{
				return true;
			}
			return other1.operator_not_equals(other2);
		}

		public static bool operator <(GalaxyID other1, GalaxyID other2)
		{
			return other1.operator_less(other2);
		}

		public static bool operator >(GalaxyID other1, GalaxyID other2)
		{
			return !other1.operator_less(other2) && !other1.operator_equals(other2);
		}

		public override int GetHashCode()
		{
			return (int)ToUint64();
		}

		public override bool Equals(object obj)
		{
			GalaxyID galaxyID = obj as GalaxyID;
			if (galaxyID == null)
			{
				return false;
			}
			return operator_equals(galaxyID);
		}

		public override string ToString()
		{
			return ToUint64().ToString();
		}

		public static GalaxyID FromRealID(IDType type, ulong value)
		{
      throw new Exception("No worky");
		}

		private GalaxyID operator_assign(GalaxyID other)
		{
      throw new Exception("No worky");
		}

		private bool operator_less(GalaxyID other)
		{
      throw new Exception("No worky");
		}

		private bool operator_equals(GalaxyID other)
		{
      throw new Exception("No worky");
		}

		private bool operator_not_equals(GalaxyID other)
		{
      throw new Exception("No worky");
		}

		public bool IsValid()
		{
			return false;
		}

		public ulong ToUint64()
		{
      throw new Exception("No worky");
		}

		public ulong GetRealID()
		{
      throw new Exception("No worky");
		}

		public IDType GetIDType()
		{
      throw new Exception("No worky");
		}
	}
	public static class GalaxyInstance
	{
		public class Error : ApplicationException
		{
			public Error(string message)
				: base(message)
			{
			}
		}

		public class UnauthorizedAccessError : Error
		{
			public UnauthorizedAccessError(string message)
				: base(message)
			{
			}
		}

		public class InvalidArgumentError : Error
		{
			public InvalidArgumentError(string message)
				: base(message)
			{
			}
		}

		public class InvalidStateError : Error
		{
			public InvalidStateError(string message)
				: base(message)
			{
			}
		}

		public class RuntimeError : Error
		{
			public RuntimeError(string message)
				: base(message)
			{
			}
		}

		private class CustomExceptionHelper
		{
			public delegate void CustomExceptionDelegate(IError.Type type, string message);

			private static CustomExceptionDelegate customDelegate;

			static CustomExceptionHelper()
			{
				customDelegate = SetPendingCustomException;
				CustomExceptionRegisterCallback(customDelegate);
			}

			public static void CustomExceptionRegisterCallback(CustomExceptionDelegate customCallback)
			{
			}

			private static void SetPendingCustomException(IError.Type type, string message)
			{
			}
		}

		private static CustomExceptionHelper exceptionHelper;

		static GalaxyInstance()
		{
			exceptionHelper = new CustomExceptionHelper();
		}

		public static IError GetError()
		{
			return null;
		}

		public static IListenerRegistrar ListenerRegistrar()
		{
			return null;
		}

		public static IListenerRegistrar GameServerListenerRegistrar()
		{
			return null;
		}

		public static void Init(InitParams initpParams)
		{
		}

		public static void InitGameServer(InitParams initpParams)
		{
		}

		public static void Shutdown(bool unloadModule)
		{
		}

		public static IUser User()
		{
			return new IUser();
		}

		public static IFriends Friends()
		{
			return null;
		}

		public static IChat Chat()
		{
			return null;
		}

		public static IMatchmaking Matchmaking()
		{
			return null;
		}

		public static INetworking Networking()
		{
			return null;
		}

		public static INetworking ServerNetworking()
		{
			return null;
		}

		public static IStats Stats()
		{
			return null;
		}

		public static IUtils Utils()
		{
			return null;
		}

		public static IApps Apps()
		{
			return null;
		}

		public static IStorage Storage()
		{
			return null;
		}

		public static ICustomNetworking CustomNetworking()
		{
			return null;
		}

		public static ILogger Logger()
		{
			return null;
		}

		public static void ProcessData()
		{
		}

		public static void ShutdownGameServer()
		{
		}

		public static IUser GameServerUser()
		{
			return null;
		}

		public static IMatchmaking GameServerMatchmaking()
		{
			return null;
		}

		public static INetworking GameServerNetworking()
		{
			return null;
		}

		public static ILogger GameServerLogger()
		{
			return null;
		}

		public static void ProcessGameServerData()
		{
		}
	}
	public abstract class GalaxyTypeAwareListenerAccessToken : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerAchievementChange : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerAuth : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerChatRoomMessages : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerChatRoomMessageSend : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerChatRoomMessagesRetrieve : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerChatRoomWithUserRetrieve : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerConnectionClose : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerConnectionData : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerConnectionOpen : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerEncryptedAppTicket : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerFileShare : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerFriendAdd : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerFriendDelete : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerFriendInvitation : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerFriendInvitationListRetrieve : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerFriendInvitationRespondTo : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerFriendInvitationSend : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerFriendList : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerGameInvitationReceived : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerGameJoinRequested : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerLeaderboardEntriesRetrieve : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerLeaderboardRetrieve : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerLeaderboardScoreUpdate : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerLeaderboardsRetrieve : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerLobbyCreated : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerLobbyData : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerLobbyDataRetrieve : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerLobbyDataUpdate : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerLobbyEntered : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerLobbyLeft : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerLobbyList : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerLobbyMemberDataUpdate : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerLobbyMemberState : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerLobbyMessage : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerLobbyOwnerChange : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerNatTypeDetection : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerNetworking : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerNotification : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerOperationalStateChange : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerOtherSessionStart : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerOverlayInitializationStateChange : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerOverlayStateChange : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerOverlayVisibilityChange : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerPersonaDataChanged : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerRichPresence : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerRichPresenceChange : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerRichPresenceRetrieve : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerSendInvitation : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
      throw new Exception("No worky");
		}
	}
	public abstract class GalaxyTypeAwareListenerSentFriendInvitationListRetrieve : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
			return ListenerType.LISTENER_TYPE_BEGIN;
		}
	}
	public abstract class GalaxyTypeAwareListenerServerNetworking : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
			return ListenerType.LISTENER_TYPE_BEGIN;
		}
	}
	public abstract class GalaxyTypeAwareListenerSharedFileDownload : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
			return ListenerType.LISTENER_TYPE_BEGIN;
		}
	}
	public abstract class GalaxyTypeAwareListenerSpecificUserData : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
			return ListenerType.LISTENER_TYPE_BEGIN;
		}
	}
	public abstract class GalaxyTypeAwareListenerStatsAndAchievementsStore : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
			return ListenerType.LISTENER_TYPE_BEGIN;
		}
	}
	public abstract class GalaxyTypeAwareListenerUserData : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
			return ListenerType.LISTENER_TYPE_BEGIN;
		}
	}
	public abstract class GalaxyTypeAwareListenerUserFind : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
			return ListenerType.LISTENER_TYPE_BEGIN;
		}
	}
	public abstract class GalaxyTypeAwareListenerUserInformationRetrieve : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
			return ListenerType.LISTENER_TYPE_BEGIN;
		}
	}
	public abstract class GalaxyTypeAwareListenerUserStatsAndAchievementsRetrieve : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
			return ListenerType.LISTENER_TYPE_BEGIN;
		}
	}
	public abstract class GalaxyTypeAwareListenerUserTimePlayedRetrieve : IGalaxyListener
	{
		public static ListenerType GetListenerType()
		{
			return ListenerType.LISTENER_TYPE_BEGIN;
		}
	}
	public abstract class GameServerGlobalAccessTokenListener : IAccessTokenListener
	{
	}
	public abstract class GameServerGlobalAuthListener : IAuthListener
	{
	}
	public abstract class GameServerGlobalEncryptedAppTicketListener : IEncryptedAppTicketListener
	{
	}
	public abstract class GameServerGlobalLobbyCreatedListener : ILobbyCreatedListener
	{
	}
	public abstract class GameServerGlobalLobbyDataListener : ILobbyDataListener
	{
	}
	public abstract class GameServerGlobalLobbyDataRetrieveListener : ILobbyDataRetrieveListener
	{
	}
	public abstract class GameServerGlobalLobbyDataUpdateListener : ILobbyDataUpdateListener
	{
	}
	public abstract class GameServerGlobalLobbyEnteredListener : ILobbyEnteredListener
	{
	}
	public abstract class GameServerGlobalLobbyLeftListener : ILobbyLeftListener
	{
	}
	public abstract class GameServerGlobalLobbyMemberDataUpdateListener : ILobbyMemberDataUpdateListener
	{
	}
	public abstract class GameServerGlobalLobbyMemberStateListener : ILobbyMemberStateListener
	{
	}
	public abstract class GameServerGlobalLobbyMessageListener : ILobbyMessageListener
	{
	}
	public abstract class GameServerGlobalOperationalStateChangeListener : IOperationalStateChangeListener
	{
	}
	public abstract class GameServerGlobalRichPresenceRetrieveListener : IRichPresenceRetrieveListener
	{
	}
	public abstract class GameServerGlobalSpecificUserDataListener : ISpecificUserDataListener
	{
	}
	public abstract class GameServerGlobalUserInformationRetrieveListener : IUserInformationRetrieveListener
	{
	}
	public abstract class GlobalAccessTokenListener : IAccessTokenListener
	{
	}
	public abstract class GlobalAchievementChangeListener : IAchievementChangeListener
	{
	}
	public abstract class GlobalAuthListener : IAuthListener
	{
	}
	public abstract class GlobalChatRoomMessageSendListener : IChatRoomMessageSendListener
	{
	}
	public abstract class GlobalChatRoomMessagesListener : IChatRoomMessagesListener
	{
	}
	public abstract class GlobalChatRoomMessagesRetrieveListener : IChatRoomMessagesRetrieveListener
	{
	}
	public abstract class GlobalChatRoomWithUserRetrieveListener : IChatRoomWithUserRetrieveListener
	{
	}
	public abstract class GlobalConnectionOpenListener : IConnectionOpenListener
	{
	}
	public abstract class GlobalEncryptedAppTicketListener : IEncryptedAppTicketListener
	{
	}
	public abstract class GlobalFileShareListener : IFileShareListener
	{
	}
	public abstract class GlobalFriendAddListener : IFriendAddListener
	{
	}
	public abstract class GlobalFriendDeleteListener : IFriendDeleteListener
	{
	}
	public abstract class GlobalFriendInvitationListener : IFriendInvitationListener
	{
	}
	public abstract class GlobalFriendInvitationListRetrieveListener : IFriendInvitationListRetrieveListener
	{
	}
	public abstract class GlobalFriendInvitationRespondToListener : IFriendInvitationRespondToListener
	{
	}
	public abstract class GlobalFriendInvitationSendListener : IFriendInvitationSendListener
	{
	}
	public abstract class GlobalFriendListListener : IFriendListListener
	{
	}
	public abstract class GlobalGameInvitationReceivedListener : IGameInvitationReceivedListener
	{
	}
	public abstract class GlobalGameJoinRequestedListener : IGameJoinRequestedListener
	{
	}
	public abstract class GlobalLeaderboardEntriesRetrieveListener : ILeaderboardEntriesRetrieveListener
	{
	}
	public abstract class GlobalLeaderboardRetrieveListener : ILeaderboardRetrieveListener
	{
	}
	public abstract class GlobalLeaderboardScoreUpdateListener : ILeaderboardScoreUpdateListener
	{
	}
	public abstract class GlobalLeaderboardsRetrieveListener : ILeaderboardsRetrieveListener
	{
	}
	public abstract class GlobalLobbyCreatedListener : ILobbyCreatedListener
	{
	}
	public abstract class GlobalLobbyDataListener : ILobbyDataListener
	{
	}
	public abstract class GlobalLobbyDataRetrieveListener : ILobbyDataRetrieveListener
	{
	}
	public abstract class GlobalLobbyDataUpdateListener : ILobbyDataUpdateListener
	{
	}
	public abstract class GlobalLobbyEnteredListener : ILobbyEnteredListener
	{
	}
	public abstract class GlobalLobbyLeftListener : ILobbyLeftListener
	{
	}
	public abstract class GlobalLobbyListListener : ILobbyListListener
	{
	}
	public abstract class GlobalLobbyMemberDataUpdateListener : ILobbyMemberDataUpdateListener
	{
	}
	public abstract class GlobalLobbyMemberStateListener : ILobbyMemberStateListener
	{
	}
	public abstract class GlobalLobbyMessageListener : ILobbyMessageListener
	{
	}
	public abstract class GlobalLobbyOwnerChangeListener : ILobbyOwnerChangeListener
	{
	}
	public abstract class GlobalNatTypeDetectionListener : INatTypeDetectionListener
	{
	}
	public abstract class GlobalNetworkingListener : INetworkingListener
	{
	}
	public abstract class GlobalNotificationListener : INotificationListener
	{
	}
	public abstract class GlobalOperationalStateChangeListener : IOperationalStateChangeListener
	{
	}
	public abstract class GlobalOtherSessionStartListener : IOtherSessionStartListener
	{
	}
	public abstract class GlobalOverlayInitializationStateChangeListener : IOverlayInitializationStateChangeListener
	{
	}
	public abstract class GlobalOverlayStateChangeListener : IOverlayStateChangeListener
	{
	}
	public abstract class GlobalOverlayVisibilityChangeListener : IOverlayVisibilityChangeListener
	{
	}
	public abstract class GlobalPersonaDataChangedListener : IPersonaDataChangedListener
	{
	}
	public abstract class GlobalRichPresenceChangeListener : IRichPresenceChangeListener
	{
	}
	public abstract class GlobalRichPresenceListener : IRichPresenceListener
	{
	}
	public abstract class GlobalRichPresenceRetrieveListener : IRichPresenceRetrieveListener
	{
	}
	public abstract class GlobalSendInvitationListener : ISendInvitationListener
	{
	}
	public abstract class GlobalSentFriendInvitationListRetrieveListener : ISentFriendInvitationListRetrieveListener
	{
	}
	public abstract class GlobalServerNetworkingListener : IServerNetworkingListener
	{
	}
	public abstract class GlobalSharedFileDownloadListener : ISharedFileDownloadListener
	{
	}
	public abstract class GlobalSpecificUserDataListener : ISpecificUserDataListener
	{
	}
	public abstract class GlobalStatsAndAchievementsStoreListener : IStatsAndAchievementsStoreListener
	{
	}
	public abstract class GlobalUserDataListener : IUserDataListener
	{
	}
	public abstract class GlobalUserFindListener : IUserFindListener
	{
	}
	public abstract class GlobalUserInformationRetrieveListener : IUserInformationRetrieveListener
	{
	}
	public abstract class GlobalUserStatsAndAchievementsRetrieveListener : IUserStatsAndAchievementsRetrieveListener
	{
	}
	public abstract class GlobalUserTimePlayedRetrieveListener : IUserTimePlayedRetrieveListener
	{
	}
	public abstract class IAccessTokenListener : GalaxyTypeAwareListenerAccessToken
	{
		public abstract void OnAccessTokenChanged();
	}
	public abstract class IAchievementChangeListener : GalaxyTypeAwareListenerAchievementChange
	{
		public abstract void OnAchievementUnlocked(string name);
	}
	public class IApps : IDisposable
	{
		public virtual void Dispose()
		{
		}

		public virtual bool IsDlcInstalled(ulong productID)
		{
			return false;
		}

		public virtual string GetCurrentGameLanguage(ulong productID)
		{
			return "en";
		}

		public virtual string GetCurrentGameLanguage()
		{
			return "en";
		}

		public virtual void GetCurrentGameLanguageCopy(out string buffer, uint bufferLength, ulong productID)
		{
      buffer = "en";
		}

		public virtual void GetCurrentGameLanguageCopy(out string buffer, uint bufferLength)
		{
      buffer = "en";
		}
	}
	public abstract class IAuthListener : GalaxyTypeAwareListenerAuth
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_GALAXY_SERVICE_NOT_AVAILABLE,
			FAILURE_REASON_GALAXY_SERVICE_NOT_SIGNED_IN,
			FAILURE_REASON_CONNECTION_FAILURE,
			FAILURE_REASON_NO_LICENSE,
			FAILURE_REASON_INVALID_CREDENTIALS,
			FAILURE_REASON_GALAXY_NOT_INITIALIZED,
			FAILURE_REASON_EXTERNAL_SERVICE_FAILURE
		}

		public abstract void OnAuthSuccess();

		public abstract void OnAuthFailure(FailureReason failureReason);

		public abstract void OnAuthLost();
	}
	public class IChat : IDisposable
	{
		public virtual void Dispose()
		{
		}

		public virtual void RequestChatRoomWithUser(GalaxyID userID)
		{
		}

		public virtual void RequestChatRoomMessages(ulong chatRoomID, uint limit, ulong referenceMessageID)
		{
		}

		public virtual void RequestChatRoomMessages(ulong chatRoomID, uint limit)
		{
		}

		public virtual uint SendChatRoomMessage(ulong chatRoomID, string msg)
		{
			return 0;
		}

		public virtual uint GetChatRoomMessageByIndex(uint index, ref ulong messageID, ref ChatMessageType messageType, ref GalaxyID senderID, ref uint sendTime, out string buffer, uint bufferLength)
		{
			buffer = "";
      return 0;
		}

		public virtual uint GetChatRoomMemberCount(ulong chatRoomID)
		{
      return 0;
		}

		public virtual GalaxyID GetChatRoomMemberUserIDByIndex(ulong chatRoomID, uint index)
		{
      throw new Exception("No worky");
		}

		public virtual uint GetChatRoomUnreadMessageCount(ulong chatRoomID)
		{
			return 0;
		}

		public virtual void MarkChatRoomAsRead(ulong chatRoomID)
		{
		}
	}
	public abstract class IChatRoomMessageSendListener : GalaxyTypeAwareListenerChatRoomMessageSend
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_FORBIDDEN,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnChatRoomMessageSendSuccess(ulong chatRoomID, uint sentMessageIndex, ulong messageID, uint sendTime);

		public abstract void OnChatRoomMessageSendFailure(ulong chatRoomID, uint sentMessageIndex, FailureReason failureReason);
	}
	public abstract class IChatRoomMessagesListener : GalaxyTypeAwareListenerChatRoomMessages
	{
		public abstract void OnChatRoomMessagesReceived(ulong chatRoomID, uint messageCount, uint longestMessageLenght);
	}
	public abstract class IChatRoomMessagesRetrieveListener : GalaxyTypeAwareListenerChatRoomMessagesRetrieve
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_FORBIDDEN,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnChatRoomMessagesRetrieveSuccess(ulong chatRoomID, uint messageCount, uint longestMessageLenght);

		public abstract void OnChatRoomMessagesRetrieveFailure(ulong chatRoomID, FailureReason failureReason);
	}
	public abstract class IChatRoomWithUserRetrieveListener : GalaxyTypeAwareListenerChatRoomWithUserRetrieve
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_FORBIDDEN,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnChatRoomWithUserRetrieveSuccess(GalaxyID userID, ulong chatRoomID);

		public abstract void OnChatRoomWithUserRetrieveFailure(GalaxyID userID, FailureReason failureReason);
	}
	public abstract class IConnectionCloseListener : GalaxyTypeAwareListenerConnectionClose
	{
		public enum CloseReason
		{
						CLOSE_REASON_UNDEFINED
		}

		public abstract void OnConnectionClosed(ulong connectionID, CloseReason closeReason);
	}
	public abstract class IConnectionDataListener : GalaxyTypeAwareListenerConnectionData
	{
		public abstract void OnConnectionDataReceived(ulong connectionID, uint dataSize);
	}
	public abstract class IConnectionOpenListener : GalaxyTypeAwareListenerConnectionOpen
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnConnectionOpenSuccess(string connectionString, ulong connectionID);

		public abstract void OnConnectionOpenFailure(string connectionString, FailureReason failureReason);
	}
	public class ICustomNetworking : IDisposable
	{
		public virtual void Dispose()
		{
		}

		public virtual void OpenConnection(string connectionString)
		{
		}

		public virtual void CloseConnection(ulong connectionID)
		{
		}

		public virtual void SendData(ulong connectionID, byte[] data, uint dataSize)
		{
		}

		public virtual uint GetAvailableDataSize(ulong connectionID)
		{
			return 0;
		}

		public virtual void PeekData(ulong connectionID, byte[] dest, uint dataSize)
		{
		}

		public virtual void ReadData(ulong connectionID, byte[] dest, uint dataSize)
		{
		}

		public virtual void PopData(ulong connectionID, uint dataSize)
		{
		}
	}
	public abstract class IEncryptedAppTicketListener : GalaxyTypeAwareListenerEncryptedAppTicket
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnEncryptedAppTicketRetrieveSuccess();

		public virtual void OnEncryptedAppTicketRetrieveFailure(FailureReason failureReason)
		{
		}
	}
	public class IError : IDisposable
	{
		public virtual void Dispose()
		{
		}

		public enum Type
		{
			UNAUTHORIZED_ACCESS,
			INVALID_ARGUMENT,
			INVALID_STATE,
			RUNTIME_ERROR
		}

		public override string ToString()
		{
			return $"{GetName()}: {GetMsg()} ({GetErrorType().ToString()})";
		}

		public virtual string GetName()
		{
			return "";
		}

		public virtual string GetMsg()
		{
			return "";
		}

		public virtual Type GetErrorType()
		{
			return Type.RUNTIME_ERROR;
		}
	}
	public abstract class IFileShareListener : GalaxyTypeAwareListenerFileShare
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnFileShareSuccess(string fileName, ulong sharedFileID);

		public abstract void OnFileShareFailure(string fileName, FailureReason failureReason);
	}
	public abstract class IFriendAddListener : GalaxyTypeAwareListenerFriendAdd
	{
		public enum InvitationDirection
		{
						INVITATION_DIRECTION_INCOMING,
						INVITATION_DIRECTION_OUTGOING
		}

		public abstract void OnFriendAdded(GalaxyID userID, InvitationDirection invitationDirection);
	}
	public abstract class IFriendDeleteListener : GalaxyTypeAwareListenerFriendDelete
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnFriendDeleteSuccess(GalaxyID userID);

		public abstract void OnFriendDeleteFailure(GalaxyID userID, FailureReason failureReason);
	}
	public abstract class IFriendInvitationListener : GalaxyTypeAwareListenerFriendInvitation
	{
		public abstract void OnFriendInvitationReceived(GalaxyID userID, uint sendTime);
	}
	public abstract class IFriendInvitationListRetrieveListener : GalaxyTypeAwareListenerFriendInvitationListRetrieve
	{
		public enum FailureReason
		{
						FAILURE_REASON_UNDEFINED,
						FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnFriendInvitationListRetrieveSuccess();

		public abstract void OnFriendInvitationListRetrieveFailure(FailureReason failureReason);
	}
	public abstract class IFriendInvitationRespondToListener : GalaxyTypeAwareListenerFriendInvitationRespondTo
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_USER_DOES_NOT_EXIST,
			FAILURE_REASON_FRIEND_INVITATION_DOES_NOT_EXIST,
			FAILURE_REASON_USER_ALREADY_FRIEND,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnFriendInvitationRespondToSuccess(GalaxyID userID, bool accept);

		public abstract void OnFriendInvitationRespondToFailure(GalaxyID userID, FailureReason failureReason);
	}
	public abstract class IFriendInvitationSendListener : GalaxyTypeAwareListenerFriendInvitationSend
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_USER_DOES_NOT_EXIST,
			FAILURE_REASON_USER_ALREADY_INVITED,
			FAILURE_REASON_USER_ALREADY_FRIEND,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnFriendInvitationSendSuccess(GalaxyID userID);

		public abstract void OnFriendInvitationSendFailure(GalaxyID userID, FailureReason failureReason);
	}
	public abstract class IFriendListListener : GalaxyTypeAwareListenerFriendList
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnFriendListRetrieveSuccess();

		public abstract void OnFriendListRetrieveFailure(FailureReason failureReason);
	}
	public class IFriends : IDisposable
	{
		public virtual void Dispose()
		{
		}

		public virtual uint GetDefaultAvatarCriteria()
		{
			return 0;
		}

		public virtual void SetDefaultAvatarCriteria(uint defaultAvatarCriteria)
		{
		}

		public virtual void RequestUserInformation(GalaxyID userID, uint avatarCriteria, IUserInformationRetrieveListener listener)
		{
		}

		public virtual void RequestUserInformation(GalaxyID userID, uint avatarCriteria)
		{
		}

		public virtual void RequestUserInformation(GalaxyID userID)
		{
		}

		public virtual bool IsUserInformationAvailable(GalaxyID userID)
		{
			return false;
		}

		public virtual string GetPersonaName()
		{
			return "";
		}

		public virtual void GetPersonaNameCopy(out string buffer, uint bufferLength)
		{
      buffer = "";
		}

		public virtual PersonaState GetPersonaState()
		{
      return PersonaState.PERSONA_STATE_OFFLINE;
		}

		public virtual string GetFriendPersonaName(GalaxyID userID)
		{
			return "";
		}

		public virtual void GetFriendPersonaNameCopy(GalaxyID userID, out string buffer, uint bufferLength)
		{
      buffer = "";
		}

		public virtual PersonaState GetFriendPersonaState(GalaxyID userID)
		{
      return PersonaState.PERSONA_STATE_OFFLINE;
		}

		public virtual string GetFriendAvatarUrl(GalaxyID userID, AvatarType avatarType)
		{
			return "";
		}

		public virtual void GetFriendAvatarUrlCopy(GalaxyID userID, AvatarType avatarType, out string buffer, uint bufferLength)
		{
      buffer = "";
		}

		public virtual uint GetFriendAvatarImageID(GalaxyID userID, AvatarType avatarType)
		{
			return 0;
		}

		public virtual void GetFriendAvatarImageRGBA(GalaxyID userID, AvatarType avatarType, byte[] buffer, uint bufferLength)
		{
		}

		public virtual bool IsFriendAvatarImageRGBAAvailable(GalaxyID userID, AvatarType avatarType)
		{
			return false;
		}

		public virtual void RequestFriendList(IFriendListListener listener)
		{
		}

		public virtual void RequestFriendList()
		{
		}

		public virtual bool IsFriend(GalaxyID userID)
		{
			return false;
		}

		public virtual uint GetFriendCount()
		{
			return 0;
		}

		public virtual GalaxyID GetFriendByIndex(uint index)
		{
			return null;
		}

		public virtual void SendFriendInvitation(GalaxyID userID, IFriendInvitationSendListener listener)
		{
		}

		public virtual void SendFriendInvitation(GalaxyID userID)
		{
		}

		public virtual void RequestFriendInvitationList(IFriendInvitationListRetrieveListener listener)
		{
		}

		public virtual void RequestFriendInvitationList()
		{
		}

		public virtual void RequestSentFriendInvitationList(ISentFriendInvitationListRetrieveListener listener)
		{
		}

		public virtual void RequestSentFriendInvitationList()
		{
		}

		public virtual uint GetFriendInvitationCount()
		{
			return 0;
		}

		public virtual void GetFriendInvitationByIndex(uint index, ref GalaxyID userID, ref uint sendTime)
		{
		}

		public virtual void RespondToFriendInvitation(GalaxyID userID, bool accept, IFriendInvitationRespondToListener listener)
		{
		}

		public virtual void RespondToFriendInvitation(GalaxyID userID, bool accept)
		{
		}

		public virtual void DeleteFriend(GalaxyID userID, IFriendDeleteListener listener)
		{
		}

		public virtual void DeleteFriend(GalaxyID userID)
		{
		}

		public virtual void SetRichPresence(string key, string value, IRichPresenceChangeListener listener)
		{
		}

		public virtual void SetRichPresence(string key, string value)
		{
		}

		public virtual void DeleteRichPresence(string key, IRichPresenceChangeListener listener)
		{
		}

		public virtual void DeleteRichPresence(string key)
		{
		}

		public virtual void ClearRichPresence(IRichPresenceChangeListener listener)
		{
		}

		public virtual void ClearRichPresence()
		{
		}

		public virtual void RequestRichPresence(GalaxyID userID, IRichPresenceRetrieveListener listener)
		{
		}

		public virtual void RequestRichPresence(GalaxyID userID)
		{
		}

		public virtual void RequestRichPresence()
		{
		}

		public virtual string GetRichPresence(string key, GalaxyID userID)
		{
			return "";
		}

		public virtual string GetRichPresence(string key)
		{
			return "";
		}

		public virtual void GetRichPresenceCopy(string key, out string buffer, uint bufferLength, GalaxyID userID)
		{
      buffer = "";
		}

		public virtual void GetRichPresenceCopy(string key, out string buffer, uint bufferLength)
		{
      buffer = "";
		}

		public virtual uint GetRichPresenceCount(GalaxyID userID)
		{
			return 0;
		}

		public virtual uint GetRichPresenceCount()
		{
			return 0;
		}

		public virtual void GetRichPresenceByIndex(uint index, ref byte[] key, uint keyLength, ref byte[] value, uint valueLength, GalaxyID userID)
		{
		}

		public virtual void GetRichPresenceByIndex(uint index, ref byte[] key, uint keyLength, ref byte[] value, uint valueLength)
		{
		}

		public virtual void ShowOverlayInviteDialog(string connectionString)
		{
		}

		public virtual void SendInvitation(GalaxyID userID, string connectionString, ISendInvitationListener listener)
		{
		}

		public virtual void SendInvitation(GalaxyID userID, string connectionString)
		{
		}

		public virtual void FindUser(string userSpecifier, IUserFindListener listener)
		{
		}

		public virtual void FindUser(string userSpecifier)
		{
		}

		public virtual bool IsUserInTheSameGame(GalaxyID userID)
		{
			return false;
		}
	}
	public class IGalaxyListener : IDisposable
	{
		public virtual void Dispose()
		{
		}
	}
	public abstract class IGameInvitationReceivedListener : GalaxyTypeAwareListenerGameInvitationReceived
	{
		public abstract void OnGameInvitationReceived(GalaxyID userID, string connectionString);
	}
	public abstract class IGameJoinRequestedListener : GalaxyTypeAwareListenerGameJoinRequested
	{
		public abstract void OnGameJoinRequested(GalaxyID userID, string connectionString);
	}
	public class IInvalidArgumentError : IError
	{
	}
	public class IInvalidStateError : IError
	{
	}
	public abstract class ILeaderboardEntriesRetrieveListener : GalaxyTypeAwareListenerLeaderboardEntriesRetrieve
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_NOT_FOUND,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnLeaderboardEntriesRetrieveSuccess(string name, uint entryCount);

		public abstract void OnLeaderboardEntriesRetrieveFailure(string name, FailureReason failureReason);
	}
	public abstract class ILeaderboardRetrieveListener : GalaxyTypeAwareListenerLeaderboardRetrieve
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnLeaderboardRetrieveSuccess(string name);

		public abstract void OnLeaderboardRetrieveFailure(string name, FailureReason failureReason);
	}
	public abstract class ILeaderboardScoreUpdateListener : GalaxyTypeAwareListenerLeaderboardScoreUpdate
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_NO_IMPROVEMENT,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnLeaderboardScoreUpdateSuccess(string name, int score, uint oldRank, uint newRank);

		public abstract void OnLeaderboardScoreUpdateFailure(string name, int score, FailureReason failureReason);
	}
	public abstract class ILeaderboardsRetrieveListener : GalaxyTypeAwareListenerLeaderboardsRetrieve
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnLeaderboardsRetrieveSuccess();

		public abstract void OnLeaderboardsRetrieveFailure(FailureReason failureReason);
	}
	public class IListenerRegistrar : IDisposable
	{
		public virtual void Dispose()
		{
		}

		public virtual void Register(ListenerType listenerType, IGalaxyListener listener)
		{
		}

		public virtual void Unregister(ListenerType listenerType, IGalaxyListener listener)
		{
		}
	}
	public abstract class ILobbyCreatedListener : GalaxyTypeAwareListenerLobbyCreated
	{
		public abstract void OnLobbyCreated(GalaxyID lobbyID, LobbyCreateResult _result);
	}
	public abstract class ILobbyDataListener : GalaxyTypeAwareListenerLobbyData
	{
		public abstract void OnLobbyDataUpdated(GalaxyID lobbyID, GalaxyID memberID);
	}
	public abstract class ILobbyDataRetrieveListener : GalaxyTypeAwareListenerLobbyDataRetrieve
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_LOBBY_DOES_NOT_EXIST,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnLobbyDataRetrieveSuccess(GalaxyID lobbyID);

		public abstract void OnLobbyDataRetrieveFailure(GalaxyID lobbyID, FailureReason failureReason);
	}
	public abstract class ILobbyDataUpdateListener : GalaxyTypeAwareListenerLobbyDataUpdate
	{
		public enum FailureReason
		{
						FAILURE_REASON_UNDEFINED,
						FAILURE_REASON_LOBBY_DOES_NOT_EXIST,
						FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnLobbyDataUpdateSuccess(GalaxyID lobbyID);

		public abstract void OnLobbyDataUpdateFailure(GalaxyID lobbyID, FailureReason failureReason);
	}
	public abstract class ILobbyEnteredListener : GalaxyTypeAwareListenerLobbyEntered
	{
		public abstract void OnLobbyEntered(GalaxyID lobbyID, LobbyEnterResult _result);
	}
	public abstract class ILobbyLeftListener : GalaxyTypeAwareListenerLobbyLeft
	{
		public abstract void OnLobbyLeft(GalaxyID lobbyID, bool ioFailure);
	}
	public abstract class ILobbyListListener : GalaxyTypeAwareListenerLobbyList
	{
		public abstract void OnLobbyList(uint lobbyCount, LobbyListResult _result);
	}
	public abstract class ILobbyMemberDataUpdateListener : GalaxyTypeAwareListenerLobbyMemberDataUpdate
	{
		public enum FailureReason
		{
						FAILURE_REASON_UNDEFINED,
						FAILURE_REASON_LOBBY_DOES_NOT_EXIST,
						FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnLobbyMemberDataUpdateSuccess(GalaxyID lobbyID, GalaxyID memberID);

		public abstract void OnLobbyMemberDataUpdateFailure(GalaxyID lobbyID, GalaxyID memberID, FailureReason failureReason);
	}
	public abstract class ILobbyMemberStateListener : GalaxyTypeAwareListenerLobbyMemberState
	{
		public abstract void OnLobbyMemberStateChanged(GalaxyID lobbyID, GalaxyID memberID, LobbyMemberStateChange memberStateChange);
	}
	public abstract class ILobbyMessageListener : GalaxyTypeAwareListenerLobbyMessage
	{
		public abstract void OnLobbyMessageReceived(GalaxyID lobbyID, GalaxyID senderID, uint messageID, uint messageLength);
	}
	public abstract class ILobbyOwnerChangeListener : GalaxyTypeAwareListenerLobbyOwnerChange
	{
		public abstract void OnLobbyOwnerChanged(GalaxyID lobbyID, GalaxyID newOwnerID);
	}
	public class ILogger : IDisposable
	{
		public virtual void Dispose()
		{
		}

		public virtual void Trace(string format)
		{
		}

		public virtual void Debug(string format)
		{
		}

		public virtual void Info(string format)
		{
		}

		public virtual void Warning(string format)
		{
		}

		public virtual void Error(string format)
		{
		}

		public virtual void Fatal(string format)
		{
		}
	}
	public class IMatchmaking : IDisposable
	{
		public virtual void Dispose()
		{
		}

		public bool SendLobbyMessage(GalaxyID lobbyID, string msg)
		{
			return false;
		}

		public uint GetLobbyMessage(GalaxyID lobbyID, uint messageID, ref GalaxyID _senderID, out string msg, uint internalBufferLen = 1024u)
		{
			msg = "";
      return 0;
		}

		public virtual void CreateLobby(LobbyType lobbyType, uint maxMembers, bool joinable, LobbyTopologyType lobbyTopologyType, ILobbyCreatedListener lobbyCreatedListener, ILobbyEnteredListener lobbyEnteredListener)
		{
		}

		public virtual void CreateLobby(LobbyType lobbyType, uint maxMembers, bool joinable, LobbyTopologyType lobbyTopologyType, ILobbyCreatedListener lobbyCreatedListener)
		{
		}

		public virtual void CreateLobby(LobbyType lobbyType, uint maxMembers, bool joinable, LobbyTopologyType lobbyTopologyType)
		{
		}

		public virtual void RequestLobbyList(bool allowFullLobbies, ILobbyListListener listener)
		{
		}

		public virtual void RequestLobbyList(bool allowFullLobbies)
		{
		}

		public virtual void RequestLobbyList()
		{
		}

		public virtual void AddRequestLobbyListResultCountFilter(uint limit)
		{
		}

		public virtual void AddRequestLobbyListStringFilter(string keyToMatch, string valueToMatch, LobbyComparisonType comparisonType)
		{
		}

		public virtual void AddRequestLobbyListNumericalFilter(string keyToMatch, int valueToMatch, LobbyComparisonType comparisonType)
		{
		}

		public virtual void AddRequestLobbyListNearValueFilter(string keyToMatch, int valueToBeCloseTo)
		{
		}

		public virtual GalaxyID GetLobbyByIndex(uint index)
		{
			return null;
		}

		public virtual void JoinLobby(GalaxyID lobbyID, ILobbyEnteredListener listener)
		{
		}

		public virtual void JoinLobby(GalaxyID lobbyID)
		{
		}

		public virtual void LeaveLobby(GalaxyID lobbyID, ILobbyLeftListener listener)
		{
		}

		public virtual void LeaveLobby(GalaxyID lobbyID)
		{
		}

		public virtual void SetMaxNumLobbyMembers(GalaxyID lobbyID, uint maxNumLobbyMembers, ILobbyDataUpdateListener listener)
		{
		}

		public virtual void SetMaxNumLobbyMembers(GalaxyID lobbyID, uint maxNumLobbyMembers)
		{
		}

		public virtual uint GetMaxNumLobbyMembers(GalaxyID lobbyID)
		{
			return 0;
		}

		public virtual uint GetNumLobbyMembers(GalaxyID lobbyID)
		{
      return 0;
		}

		public virtual GalaxyID GetLobbyMemberByIndex(GalaxyID lobbyID, uint index)
		{
			return null;
		}

		public virtual void SetLobbyType(GalaxyID lobbyID, LobbyType lobbyType, ILobbyDataUpdateListener listener)
		{
		}

		public virtual void SetLobbyType(GalaxyID lobbyID, LobbyType lobbyType)
		{
		}

		public virtual LobbyType GetLobbyType(GalaxyID lobbyID)
		{
			return LobbyType.LOBBY_TYPE_PRIVATE;
		}

		public virtual void SetLobbyJoinable(GalaxyID lobbyID, bool joinable, ILobbyDataUpdateListener listener)
		{
		}

		public virtual void SetLobbyJoinable(GalaxyID lobbyID, bool joinable)
		{
		}

		public virtual bool IsLobbyJoinable(GalaxyID lobbyID)
		{
			return false;
		}

		public virtual void RequestLobbyData(GalaxyID lobbyID, ILobbyDataRetrieveListener listener)
		{
		}

		public virtual void RequestLobbyData(GalaxyID lobbyID)
		{
		}

		public virtual string GetLobbyData(GalaxyID lobbyID, string key)
		{
			return "";
		}

		public virtual void GetLobbyDataCopy(GalaxyID lobbyID, string key, out string buffer, uint bufferLength)
		{
      buffer = "";
		}

		public virtual void SetLobbyData(GalaxyID lobbyID, string key, string value, ILobbyDataUpdateListener listener)
		{
		}

		public virtual void SetLobbyData(GalaxyID lobbyID, string key, string value)
		{
		}

		public virtual uint GetLobbyDataCount(GalaxyID lobbyID)
		{
			return 0;
		}

		public virtual bool GetLobbyDataByIndex(GalaxyID lobbyID, uint index, ref byte[] key, uint keyLength, ref byte[] value, uint valueLength)
		{
			return false;
		}

		public virtual void DeleteLobbyData(GalaxyID lobbyID, string key, ILobbyDataUpdateListener listener)
		{
		}

		public virtual void DeleteLobbyData(GalaxyID lobbyID, string key)
		{
		}

		public virtual string GetLobbyMemberData(GalaxyID lobbyID, GalaxyID memberID, string key)
		{
			return "";
		}

		public virtual void GetLobbyMemberDataCopy(GalaxyID lobbyID, GalaxyID memberID, string key, out string buffer, uint bufferLength)
		{
      buffer = "";
		}

		public virtual void SetLobbyMemberData(GalaxyID lobbyID, string key, string value, ILobbyMemberDataUpdateListener listener)
		{
		}

		public virtual void SetLobbyMemberData(GalaxyID lobbyID, string key, string value)
		{
		}

		public virtual uint GetLobbyMemberDataCount(GalaxyID lobbyID, GalaxyID memberID)
		{
			return 0;
		}

		public virtual bool GetLobbyMemberDataByIndex(GalaxyID lobbyID, GalaxyID memberID, uint index, ref byte[] key, uint keyLength, ref byte[] value, uint valueLength)
		{
			return false;
		}

		public virtual void DeleteLobbyMemberData(GalaxyID lobbyID, string key, ILobbyMemberDataUpdateListener listener)
		{
		}

		public virtual void DeleteLobbyMemberData(GalaxyID lobbyID, string key)
		{
		}

		public virtual GalaxyID GetLobbyOwner(GalaxyID lobbyID)
		{
			return null;
		}

		public virtual bool SendLobbyMessage(GalaxyID lobbyID, byte[] data, uint dataSize)
		{
			return false;
		}

		public virtual uint GetLobbyMessage(GalaxyID lobbyID, uint messageID, ref GalaxyID senderID, ref byte[] msg, uint msgLength)
		{
			return 0;
		}
	}
	public abstract class INatTypeDetectionListener : GalaxyTypeAwareListenerNatTypeDetection
	{
		public abstract void OnNatTypeDetectionSuccess(NatType natType);

		public abstract void OnNatTypeDetectionFailure();
	}
	public class INetworking : IDisposable
	{
		public virtual void Dispose()
		{
		}

		public virtual bool SendP2PPacket(GalaxyID galaxyID, byte[] data, uint dataSize, P2PSendType sendType)
		{
			return false;
		}

		public virtual bool PeekP2PPacket(byte[] dest, uint destSize, ref uint outMsgSize, ref GalaxyID outGalaxyID, byte channel)
		{
			return false;
		}

		public virtual bool PeekP2PPacket(byte[] dest, uint destSize, ref uint outMsgSize, ref GalaxyID outGalaxyID)
		{
			return false;
		}

		public virtual bool IsP2PPacketAvailable(ref uint outMsgSize, byte channel)
		{
			return false;
		}

		public virtual bool IsP2PPacketAvailable(ref uint outMsgSize)
		{
			return false;
		}

		public virtual bool ReadP2PPacket(byte[] dest, uint destSize, ref uint outMsgSize, ref GalaxyID outGalaxyID, byte channel)
		{
			return false;
		}

		public virtual bool ReadP2PPacket(byte[] dest, uint destSize, ref uint outMsgSize, ref GalaxyID outGalaxyID)
		{
			return false;
		}

		public virtual void PopP2PPacket(byte channel)
		{
		}

		public virtual void PopP2PPacket()
		{
		}

		public virtual int GetPingWith(GalaxyID galaxyID)
		{
			return 0;
		}

		public virtual void RequestNatTypeDetection()
		{
		}

		public virtual NatType GetNatType()
		{
			return NatType.NAT_TYPE_NONE;
		}

		public virtual ConnectionType GetConnectionType(GalaxyID userID)
		{
			return ConnectionType.CONNECTION_TYPE_NONE;
		}
	}
	public abstract class INetworkingListener : GalaxyTypeAwareListenerNetworking
	{
		public abstract void OnP2PPacketAvailable(uint msgSize, byte channel);
	}
	public class InitParams : IDisposable
	{
		public virtual void Dispose()
		{
		}

		public string clientID
		{
			get
			{
				return "";
			}
			set
			{
			}
		}

		public string clientSecret
		{
			get
			{
				return "";
			}
			set
			{
			}
		}

		public string configFilePath
		{
			get
			{
				return "";
			}
			set
			{
			}
		}

		public string galaxyModulePath
		{
			get
			{
				return "";
			}
			set
			{
			}
		}

		public bool loadModule
		{
			get
			{
				return false;
			}
			set
			{
			}
		}

		public InitParams(string _clientID, string _clientSecret, string _configFilePath, string _galaxyModulePath, bool _loadModule)
		{
		}

		public InitParams(string _clientID, string _clientSecret, string _configFilePath, string _galaxyModulePath)
		{
		}

		public InitParams(string _clientID, string _clientSecret, string _configFilePath)
		{
		}

		public InitParams(string _clientID, string _clientSecret)
		{
		}
	}
	public abstract class INotificationListener : GalaxyTypeAwareListenerNotification
	{
		public abstract void OnNotificationReceived(ulong notificationID, uint typeLength, uint contentSize);
	}
	public abstract class IOperationalStateChangeListener : GalaxyTypeAwareListenerOperationalStateChange
	{
		public enum OperationalState
		{
			OPERATIONAL_STATE_SIGNED_IN = 1,
			OPERATIONAL_STATE_LOGGED_ON
		}

		public abstract void OnOperationalStateChanged(uint operationalState);
	}
	public abstract class IOtherSessionStartListener : GalaxyTypeAwareListenerOtherSessionStart
	{
		public abstract void OnOtherSessionStarted();
	}
	public abstract class IOverlayInitializationStateChangeListener : GalaxyTypeAwareListenerOverlayInitializationStateChange
	{
		public abstract void OnOverlayStateChanged(OverlayState overlayState);
	}
	public abstract class IOverlayStateChangeListener : GalaxyTypeAwareListenerOverlayStateChange
	{
		public abstract void OnOverlayStateChanged(bool overlayIsActive);
	}
	public abstract class IOverlayVisibilityChangeListener : GalaxyTypeAwareListenerOverlayVisibilityChange
	{
		public virtual void OnOverlayVisibilityChanged(bool overlayVisible)
		{
		}
	}
	public abstract class IPersonaDataChangedListener : GalaxyTypeAwareListenerPersonaDataChanged
	{
		public enum PersonaStateChange
		{
			PERSONA_CHANGE_NONE = 0,
			PERSONA_CHANGE_NAME = 1,
			PERSONA_CHANGE_AVATAR = 2,
			PERSONA_CHANGE_AVATAR_DOWNLOADED_IMAGE_SMALL = 4,
			PERSONA_CHANGE_AVATAR_DOWNLOADED_IMAGE_MEDIUM = 8,
			PERSONA_CHANGE_AVATAR_DOWNLOADED_IMAGE_LARGE = 0x10,
			PERSONA_CHANGE_AVATAR_DOWNLOADED_IMAGE_ANY = 28
		}

		public abstract void OnPersonaDataChanged(GalaxyID userID, uint personaStateChange);
	}
	public abstract class IRichPresenceChangeListener : GalaxyTypeAwareListenerRichPresenceChange
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnRichPresenceChangeSuccess();

		public abstract void OnRichPresenceChangeFailure(FailureReason failureReason);
	}
	public abstract class IRichPresenceListener : GalaxyTypeAwareListenerRichPresence
	{
		public abstract void OnRichPresenceUpdated(GalaxyID userID);
	}
	public abstract class IRichPresenceRetrieveListener : GalaxyTypeAwareListenerRichPresenceRetrieve
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public virtual void OnRichPresenceRetrieveSuccess(GalaxyID userID)
		{
		}

		public virtual void OnRichPresenceRetrieveFailure(GalaxyID userID, FailureReason failureReason)
		{
		}
	}
	public class IRuntimeError : IError
	{
	}
	public abstract class ISendInvitationListener : GalaxyTypeAwareListenerSendInvitation
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_USER_DOES_NOT_EXIST,
			FAILURE_REASON_RECEIVER_DOES_NOT_ALLOW_INVITING,
			FAILURE_REASON_SENDER_DOES_NOT_ALLOW_INVITING,
			FAILURE_REASON_RECEIVER_BLOCKED,
			FAILURE_REASON_SENDER_BLOCKED,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnInvitationSendSuccess(GalaxyID userID, string connectionString);

		public abstract void OnInvitationSendFailure(GalaxyID userID, string connectionString, FailureReason failureReason);
	}
	public abstract class ISentFriendInvitationListRetrieveListener : GalaxyTypeAwareListenerSentFriendInvitationListRetrieve
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnSentFriendInvitationListRetrieveSuccess();

		public abstract void OnSentFriendInvitationListRetrieveFailure(FailureReason failureReason);
	}
	public abstract class IServerNetworkingListener : GalaxyTypeAwareListenerServerNetworking
	{
		public abstract void OnServerP2PPacketAvailable(uint msgSize, byte channel);
	}
	public abstract class ISharedFileDownloadListener : GalaxyTypeAwareListenerSharedFileDownload
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnSharedFileDownloadSuccess(ulong sharedFileID, string fileName);

		public abstract void OnSharedFileDownloadFailure(ulong sharedFileID, FailureReason failureReason);
	}
	public abstract class ISpecificUserDataListener : GalaxyTypeAwareListenerSpecificUserData
	{
		public abstract void OnSpecificUserDataUpdated(GalaxyID userID);
	}
	public class IStats : IDisposable
	{
		public virtual void Dispose()
		{
		}

		public virtual void RequestUserStatsAndAchievements(GalaxyID userID, IUserStatsAndAchievementsRetrieveListener listener)
		{
		}

		public virtual void RequestUserStatsAndAchievements(GalaxyID userID)
		{
		}

		public virtual void RequestUserStatsAndAchievements()
		{
		}

		public virtual int GetStatInt(string name, GalaxyID userID)
		{
			return 0;
		}

		public virtual int GetStatInt(string name)
		{
			return 0;
		}

		public virtual float GetStatFloat(string name, GalaxyID userID)
		{
			return 0.0F;
		}

		public virtual float GetStatFloat(string name)
		{
			return 0.0F;
		}

		public virtual void SetStatInt(string name, int value)
		{
		}

		public virtual void SetStatFloat(string name, float value)
		{
		}

		public virtual void UpdateAvgRateStat(string name, float countThisSession, double sessionLength)
		{
		}

		public virtual void GetAchievement(string name, ref bool unlocked, ref uint unlockTime, GalaxyID userID)
		{
		}

		public virtual void GetAchievement(string name, ref bool unlocked, ref uint unlockTime)
		{
		}

		public virtual void SetAchievement(string name)
		{
		}

		public virtual void ClearAchievement(string name)
		{
		}

		public virtual void StoreStatsAndAchievements(IStatsAndAchievementsStoreListener listener)
		{
		}

		public virtual void StoreStatsAndAchievements()
		{
		}

		public virtual void ResetStatsAndAchievements(IStatsAndAchievementsStoreListener listener)
		{
		}

		public virtual void ResetStatsAndAchievements()
		{
		}

		public virtual string GetAchievementDisplayName(string name)
		{
			return "";
		}

		public virtual void GetAchievementDisplayNameCopy(string name, out string buffer, uint bufferLength)
		{
      buffer = "";
		}

		public virtual string GetAchievementDescription(string name)
		{
			return "";
		}

		public virtual void GetAchievementDescriptionCopy(string name, out string buffer, uint bufferLength)
		{
      buffer = "";
		}

		public virtual bool IsAchievementVisible(string name)
		{
			return false;
		}

		public virtual bool IsAchievementVisibleWhileLocked(string name)
		{
			return false;
		}

		public virtual void RequestLeaderboards(ILeaderboardsRetrieveListener listener)
		{
		}

		public virtual void RequestLeaderboards()
		{
		}

		public virtual string GetLeaderboardDisplayName(string name)
		{
			return "";
		}

		public virtual void GetLeaderboardDisplayNameCopy(string name, out string buffer, uint bufferLength)
		{
      buffer = "";
		}

		public virtual LeaderboardSortMethod GetLeaderboardSortMethod(string name)
		{
			return LeaderboardSortMethod.LEADERBOARD_SORT_METHOD_NONE;
		}

		public virtual LeaderboardDisplayType GetLeaderboardDisplayType(string name)
		{
			return LeaderboardDisplayType.LEADERBOARD_DISPLAY_TYPE_NONE;
		}

		public virtual void RequestLeaderboardEntriesGlobal(string name, uint rangeStart, uint rangeEnd, ILeaderboardEntriesRetrieveListener listener)
		{
		}

		public virtual void RequestLeaderboardEntriesGlobal(string name, uint rangeStart, uint rangeEnd)
		{
		}

		public virtual void RequestLeaderboardEntriesAroundUser(string name, uint countBefore, uint countAfter, GalaxyID userID, ILeaderboardEntriesRetrieveListener listener)
		{
		}

		public virtual void RequestLeaderboardEntriesAroundUser(string name, uint countBefore, uint countAfter, GalaxyID userID)
		{
		}

		public virtual void RequestLeaderboardEntriesAroundUser(string name, uint countBefore, uint countAfter)
		{
		}

		public virtual void RequestLeaderboardEntriesForUsers(string name, ref GalaxyID[] userArray, ILeaderboardEntriesRetrieveListener listener)
		{
		}

		public virtual void RequestLeaderboardEntriesForUsers(string name, ref GalaxyID[] userArray)
		{
		}

		public virtual void GetRequestedLeaderboardEntry(uint index, ref uint rank, ref int score, ref GalaxyID userID)
		{
		}

		public virtual void GetRequestedLeaderboardEntryWithDetails(uint index, ref uint rank, ref int score, byte[] details, uint detailsSize, ref uint outDetailsSize, ref GalaxyID userID)
		{
		}

		public virtual void SetLeaderboardScore(string name, int score, bool forceUpdate, ILeaderboardScoreUpdateListener listener)
		{
		}

		public virtual void SetLeaderboardScore(string name, int score, bool forceUpdate)
		{
		}

		public virtual void SetLeaderboardScore(string name, int score)
		{
		}

		public virtual void SetLeaderboardScoreWithDetails(string name, int score, byte[] details, uint detailsSize, bool forceUpdate, ILeaderboardScoreUpdateListener listener)
		{
		}

		public virtual void SetLeaderboardScoreWithDetails(string name, int score, byte[] details, uint detailsSize, bool forceUpdate)
		{
		}

		public virtual void SetLeaderboardScoreWithDetails(string name, int score, byte[] details, uint detailsSize)
		{
		}

		public virtual uint GetLeaderboardEntryCount(string name)
		{
			return 0;
		}

		public virtual void FindLeaderboard(string name, ILeaderboardRetrieveListener listener)
		{
		}

		public virtual void FindLeaderboard(string name)
		{
		}

		public virtual void FindOrCreateLeaderboard(string name, string displayName, LeaderboardSortMethod sortMethod, LeaderboardDisplayType displayType, ILeaderboardRetrieveListener listener)
		{
		}

		public virtual void FindOrCreateLeaderboard(string name, string displayName, LeaderboardSortMethod sortMethod, LeaderboardDisplayType displayType)
		{
		}

		public virtual void RequestUserTimePlayed(GalaxyID userID, IUserTimePlayedRetrieveListener listener)
		{
		}

		public virtual void RequestUserTimePlayed(GalaxyID userID)
		{
		}

		public virtual void RequestUserTimePlayed()
		{
		}

		public virtual uint GetUserTimePlayed(GalaxyID userID)
		{
			return 0;
		}

		public virtual uint GetUserTimePlayed()
		{
			return 0;
		}
	}
	public abstract class IStatsAndAchievementsStoreListener : GalaxyTypeAwareListenerStatsAndAchievementsStore
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnUserStatsAndAchievementsStoreSuccess();

		public abstract void OnUserStatsAndAchievementsStoreFailure(FailureReason failureReason);
	}
	public class IStorage : IDisposable
	{
		public virtual void Dispose()
		{
		}

		public virtual void FileWrite(string fileName, byte[] data, uint dataSize)
		{
		}

		public virtual uint FileRead(string fileName, byte[] data, uint dataSize)
		{
			return 0;
		}

		public virtual void FileDelete(string fileName)
		{
		}

		public virtual bool FileExists(string fileName)
		{
			return false;
		}

		public virtual uint GetFileSize(string fileName)
		{
			return 0;
		}

		public virtual uint GetFileTimestamp(string fileName)
		{
			return 0;
		}

		public virtual uint GetFileCount()
		{
			return 0;
		}

		public virtual string GetFileNameByIndex(uint index)
		{
			return "";
		}

		public virtual void GetFileNameCopyByIndex(uint index, out string buffer, uint bufferLength)
		{
      buffer = "";
		}

		public virtual void FileShare(string fileName)
		{
		}

		public virtual void DownloadSharedFile(ulong sharedFileID)
		{
		}

		public virtual string GetSharedFileName(ulong sharedFileID)
		{
			return "";
		}

		public virtual void GetSharedFileNameCopy(ulong sharedFileID, out string buffer, uint bufferLength)
		{
      buffer = "";
		}

		public virtual uint GetSharedFileSize(ulong sharedFileID)
		{
			return 0;
		}

		public virtual GalaxyID GetSharedFileOwner(ulong sharedFileID)
		{
			return null;
		}

		public virtual uint SharedFileRead(ulong sharedFileID, byte[] data, uint dataSize, uint offset)
		{
			return 0;
		}

		public virtual uint SharedFileRead(ulong sharedFileID, byte[] data, uint dataSize)
		{
			return 0;
		}

		public virtual void SharedFileClose(ulong sharedFileID)
		{
		}

		public virtual uint GetDownloadedSharedFileCount()
		{
			return 0;
		}

		public virtual ulong GetDownloadedSharedFileByIndex(uint index)
		{
			return 0;
		}
	}
	public class IUnauthorizedAccessError : IError
	{
	}
	public class IUser : IDisposable
	{
		public virtual void Dispose()
		{
		}

		public virtual bool SignedIn()
		{
			return false;
		}

		public virtual GalaxyID GetGalaxyID()
		{
			return null;
		}

		public virtual void SignIn(string login, string password, IAuthListener listener)
		{
		}

		public virtual void SignIn(string login, string password)
		{
		}

		public virtual void SignIn(byte[] steamAppTicket, uint steamAppTicketSize, string personaName, IAuthListener listener)
		{
		}

		public virtual void SignIn(byte[] steamAppTicket, uint steamAppTicketSize, string personaName)
		{
		}

		public virtual void SignIn(bool requireOnline, IAuthListener listener)
		{
		}

		public virtual void SignIn(bool requireOnline)
		{
		}

		public virtual void SignIn()
		{
		}

		public virtual void SignIn(string ps4ClientID, string ps4TitleID, string ps4TitleSecret, uint ps4TitleSecretLength, IAuthListener listener)
		{
		}

		public virtual void SignIn(string ps4ClientID, string ps4TitleID, string ps4TitleSecret, uint ps4TitleSecretLength)
		{
		}

		public virtual void SignIn(uint xboxOneUserID, IAuthListener listener)
		{
		}

		public virtual void SignIn(uint xboxOneUserID)
		{
		}

		public virtual void SignInAnonymous(IAuthListener listener)
		{
		}

		public virtual void SignInAnonymous()
		{
		}

		public virtual void RequestUserData(GalaxyID userID)
		{
		}

		public virtual void RequestUserData()
		{
		}

		public virtual bool IsUserDataAvailable(GalaxyID userID)
		{
			return false;
		}

		public virtual bool IsUserDataAvailable()
		{
			return false;
		}

		public virtual string GetUserData(string key, GalaxyID userID)
		{
			return "";
		}

		public virtual string GetUserData(string key)
		{
			return "";
		}

		public virtual void GetUserDataCopy(string key, out string buffer, uint bufferLength, GalaxyID userID)
		{
      buffer = "";
		}

		public virtual void GetUserDataCopy(string key, out string buffer, uint bufferLength)
		{
      buffer = "";
		}

		public virtual void SetUserData(string key, string value)
		{
		}

		public virtual uint GetUserDataCount(GalaxyID userID)
		{
			return 0;
		}

		public virtual uint GetUserDataCount()
		{
			return 0;
		}

		public virtual bool GetUserDataByIndex(uint index, ref byte[] key, uint keyLength, ref byte[] value, uint valueLength, GalaxyID userID)
		{
			return false;
		}

		public virtual bool GetUserDataByIndex(uint index, ref byte[] key, uint keyLength, ref byte[] value, uint valueLength)
		{
			return false;
		}

		public virtual void DeleteUserData(string key)
		{
		}

		public virtual bool IsLoggedOn()
		{
			return false;
		}

		public virtual void RequestEncryptedAppTicket(byte[] data, uint dataSize)
		{
		}

		public virtual void GetEncryptedAppTicket(byte[] encryptedAppTicket, uint maxEncryptedAppTicketSize, ref uint currentEncryptedAppTicketSize)
		{
		}

		public virtual void SignIn(string serverKey, IAuthListener listener)
		{
		}

		public virtual void SignIn(string serverKey)
		{
		}

		public virtual ulong GetSessionID()
		{
			return 0;
		}

		public virtual string GetAccessToken()
		{
			return "";
		}

		public virtual void GetAccessTokenCopy(out string buffer, uint bufferLength)
		{
      buffer = "";
		}

		public virtual bool ReportInvalidAccessToken(string accessToken, string info)
		{
			return false;
		}

		public virtual bool ReportInvalidAccessToken(string accessToken)
		{
			return false;
		}
	}
	public abstract class IUserDataListener : GalaxyTypeAwareListenerUserData
	{
		public abstract void OnUserDataUpdated();
	}
	public abstract class IUserFindListener : GalaxyTypeAwareListenerUserFind
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_USER_NOT_FOUND,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnUserFindSuccess(string userSpecifier, GalaxyID userID);

		public abstract void OnUserFindFailure(string userSpecifier, FailureReason failureReason);
	}
	public abstract class IUserInformationRetrieveListener : GalaxyTypeAwareListenerUserInformationRetrieve
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnUserInformationRetrieveSuccess(GalaxyID userID);

		public abstract void OnUserInformationRetrieveFailure(GalaxyID userID, FailureReason failureReason);
	}
	public abstract class IUserStatsAndAchievementsRetrieveListener : GalaxyTypeAwareListenerUserStatsAndAchievementsRetrieve
	{
		public enum FailureReason
		{
						FAILURE_REASON_UNDEFINED,
						FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnUserStatsAndAchievementsRetrieveSuccess(GalaxyID userID);

		public abstract void OnUserStatsAndAchievementsRetrieveFailure(GalaxyID userID, FailureReason failureReason);
	}
	public abstract class IUserTimePlayedRetrieveListener : GalaxyTypeAwareListenerUserTimePlayedRetrieve
	{
		public enum FailureReason
		{
			FAILURE_REASON_UNDEFINED,
			FAILURE_REASON_CONNECTION_FAILURE
		}

		public abstract void OnUserTimePlayedRetrieveSuccess(GalaxyID userID);

		public abstract void OnUserTimePlayedRetrieveFailure(GalaxyID userID, FailureReason failureReason);
	}
	public class IUtils : IDisposable
	{
		public virtual void Dispose()
		{
		}

		public virtual void GetImageSize(uint imageID, ref int width, ref int height)
		{
		}

		public virtual void GetImageRGBA(uint imageID, byte[] buffer, uint bufferLength)
		{
		}

		public virtual void RegisterForNotification(string type)
		{
		}

		public virtual uint GetNotification(ulong notificationID, ref bool consumable, ref byte[] type, uint typeLength, byte[] content, uint contentSize)
		{
			return 0;
		}

		public virtual void ShowOverlayWithWebPage(string url)
		{
		}

		public virtual bool IsOverlayVisible()
		{
			return false;
		}

		public virtual OverlayState GetOverlayState()
		{
			return OverlayState.OVERLAY_STATE_UNDEFINED;
		}

		public virtual void DisableOverlayPopups(string popupGroup)
		{
		}
	}
	public enum LeaderboardDisplayType
	{
		LEADERBOARD_DISPLAY_TYPE_NONE,
		LEADERBOARD_DISPLAY_TYPE_NUMBER,
		LEADERBOARD_DISPLAY_TYPE_TIME_SECONDS,
		LEADERBOARD_DISPLAY_TYPE_TIME_MILLISECONDS
	}
	public enum LeaderboardSortMethod
	{
		LEADERBOARD_SORT_METHOD_NONE,
		LEADERBOARD_SORT_METHOD_ASCENDING,
		LEADERBOARD_SORT_METHOD_DESCENDING
	}
	public enum ListenerType
	{
		LISTENER_TYPE_BEGIN = 0,
		LOBBY_LIST = 0,
		LOBBY_CREATED = 1,
		LOBBY_ENTERED = 2,
		LOBBY_LEFT = 3,
		LOBBY_DATA = 4,
		LOBBY_MEMBER_STATE = 5,
		LOBBY_OWNER_CHANGE = 6,
		AUTH = 7,
		LOBBY_MESSAGE = 8,
		NETWORKING = 9,
		SERVER_NETWORKING = 10,
		USER_DATA = 11,
		USER_STATS_AND_ACHIEVEMENTS_RETRIEVE = 12,
		STATS_AND_ACHIEVEMENTS_STORE = 13,
		ACHIEVEMENT_CHANGE = 14,
		LEADERBOARDS_RETRIEVE = 0xF,
		LEADERBOARD_ENTRIES_RETRIEVE = 0x10,
		LEADERBOARD_SCORE_UPDATE_LISTENER = 17,
		PERSONA_DATA_CHANGED = 18,
		RICH_PRESENCE_CHANGE_LISTENER = 19,
		GAME_JOIN_REQUESTED_LISTENER = 20,
		OPERATIONAL_STATE_CHANGE = 21,
		_OVERLAY_STATE_CHANGE = 22,
		FRIEND_LIST_RETRIEVE = 23,
		ENCRYPTED_APP_TICKET_RETRIEVE = 24,
		ACCESS_TOKEN_CHANGE = 25,
		LEADERBOARD_RETRIEVE = 26,
		SPECIFIC_USER_DATA = 27,
		INVITATION_SEND = 28,
		RICH_PRESENCE_LISTENER = 29,
		GAME_INVITATION_RECEIVED_LISTENER = 30,
		NOTIFICATION_LISTENER = 0x1F,
		LOBBY_DATA_RETRIEVE = 0x20,
		USER_TIME_PLAYED_RETRIEVE = 33,
		OTHER_SESSION_START = 34,
		_STORAGE_SYNCHRONIZATION = 35,
		FILE_SHARE = 36,
		SHARED_FILE_DOWNLOAD = 37,
		CUSTOM_NETWORKING_CONNECTION_OPEN = 38,
		CUSTOM_NETWORKING_CONNECTION_CLOSE = 39,
		CUSTOM_NETWORKING_CONNECTION_DATA = 40,
		OVERLAY_INITIALIZATION_STATE_CHANGE = 41,
		OVERLAY_VISIBILITY_CHANGE = 42,
		CHAT_ROOM_WITH_USER_RETRIEVE_LISTENER = 43,
		CHAT_ROOM_MESSAGE_SEND_LISTENER = 44,
		CHAT_ROOM_MESSAGES_LISTENER = 45,
		FRIEND_INVITATION_SEND_LISTENER = 46,
		FRIEND_INVITATION_LIST_RETRIEVE_LISTENER = 47,
		FRIEND_INVITATION_LISTENER = 48,
		FRIEND_INVITATION_RESPOND_TO_LISTENER = 49,
		FRIEND_ADD_LISTENER = 50,
		FRIEND_DELETE_LISTENER = 51,
		CHAT_ROOM_MESSAGES_RETRIEVE_LISTENER = 52,
		USER_FIND_LISTENER = 53,
		NAT_TYPE_DETECTION = 54,
		SENT_FRIEND_INVITATION_LIST_RETRIEVE_LISTENER = 55,
		LOBBY_DATA_UPDATE_LISTENER = 56,
		LOBBY_MEMBER_DATA_UPDATE_LISTENER = 57,
		USER_INFORMATION_RETRIEVE_LISTENER = 58,
		RICH_PRESENCE_RETRIEVE_LISTENER = 59,
		LISTENER_TYPE_END = 60
	}
	public enum LobbyComparisonType
	{
		LOBBY_COMPARISON_TYPE_EQUAL,
		LOBBY_COMPARISON_TYPE_NOT_EQUAL,
		LOBBY_COMPARISON_TYPE_GREATER,
		LOBBY_COMPARISON_TYPE_GREATER_OR_EQUAL,
		LOBBY_COMPARISON_TYPE_LOWER,
		LOBBY_COMPARISON_TYPE_LOWER_OR_EQUAL
	}
	public enum LobbyCreateResult
	{
		LOBBY_CREATE_RESULT_SUCCESS,
		LOBBY_CREATE_RESULT_ERROR,
		LOBBY_CREATE_RESULT_CONNECTION_FAILURE
	}
	public enum LobbyEnterResult
	{
		LOBBY_ENTER_RESULT_SUCCESS,
		LOBBY_ENTER_RESULT_LOBBY_DOES_NOT_EXIST,
		LOBBY_ENTER_RESULT_LOBBY_IS_FULL,
		LOBBY_ENTER_RESULT_ERROR,
		LOBBY_ENTER_RESULT_CONNECTION_FAILURE
	}
	public enum LobbyListResult
	{
		LOBBY_LIST_RESULT_SUCCESS,
		LOBBY_LIST_RESULT_ERROR,
		LOBBY_LIST_RESULT_CONNECTION_FAILURE
	}
	public enum LobbyMemberStateChange
	{
		LOBBY_MEMBER_STATE_CHANGED_ENTERED = 1,
		LOBBY_MEMBER_STATE_CHANGED_LEFT = 2,
		LOBBY_MEMBER_STATE_CHANGED_DISCONNECTED = 4,
		LOBBY_MEMBER_STATE_CHANGED_KICKED = 8,
		LOBBY_MEMBER_STATE_CHANGED_BANNED = 0x10
	}
	public enum LobbyTopologyType
	{
		DEPRECATED_LOBBY_TOPOLOGY_TYPE_FCM_HOST_MIGRATION,
		LOBBY_TOPOLOGY_TYPE_FCM,
		LOBBY_TOPOLOGY_TYPE_STAR,
		LOBBY_TOPOLOGY_TYPE_CONNECTIONLESS,
		LOBBY_TOPOLOGY_TYPE_FCM_OWNERSHIP_TRANSITION
	}
	public enum LobbyType
	{
		LOBBY_TYPE_PRIVATE,
		LOBBY_TYPE_FRIENDS_ONLY,
		LOBBY_TYPE_PUBLIC,
		LOBBY_TYPE_INVISIBLE_TO_FRIENDS
	}
}
namespace Galaxy.Api
{
	public enum NatType
	{
		NAT_TYPE_NONE,
		NAT_TYPE_FULL_CONE,
		NAT_TYPE_ADDRESS_RESTRICTED,
		NAT_TYPE_PORT_RESTRICTED,
		NAT_TYPE_SYMMETRIC,
		NAT_TYPE_UNKNOWN
	}
	public enum OverlayState
	{
		OVERLAY_STATE_UNDEFINED,
		OVERLAY_STATE_NOT_SUPPORTED,
		OVERLAY_STATE_DISABLED,
		OVERLAY_STATE_FAILED_TO_INITIALIZE,
		OVERLAY_STATE_INITIALIZED
	}
	public enum P2PSendType
	{
		P2P_SEND_UNRELIABLE,
		P2P_SEND_RELIABLE,
		P2P_SEND_UNRELIABLE_IMMEDIATE,
		P2P_SEND_RELIABLE_IMMEDIATE
	}
	public enum PersonaState
	{
		PERSONA_STATE_OFFLINE,
		PERSONA_STATE_ONLINE
	}
}
